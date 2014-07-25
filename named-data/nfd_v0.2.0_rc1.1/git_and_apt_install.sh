#!/bin/bash

# What we need for a Gateway Node:
#    ndn-cxx
#    nfd
#    ndn-tlv-ping
#    nlsr
#      configuration files for nlsr
#

## install boost 1.55
#wget http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.gz
#tar -xzf boost_1_55_0.tar.gz
#pushd boost_1_55_0/
#./bootstrap.sh
#./b2
#sudo ./b2 install
#sudo ldconfig
#popd
#
#git clone http://github.com/named-data/wsproxy-cpp
#pushd wsproxy-cpp
#git submodule init
#git submodule update
### boost.py.update gives a different order of paths for libs and includes
### boost lib installed above is going into /usr/local so we want that first
##mv waf-tools/boost.py waf-tools/boost.py.ORIG
##cp -p ../boost.py.updated waf-tools/boost.py
#./waf configure
#./waf
#sudo ./waf install
#popd
#
sudo add-apt-repository ppa:named-data/ppa
sudo apt-get update
sudo apt-get install ndn-cxx nfd nlsr
sudo apt-get install ndn-cxx-dev
sudo apt-get install ndndump
sudo apt-get install ndn-tlv-ping
# sudo apt-get install repo-ng

# set stuff up for NLSR
# We need 
#   1. A config file specific to this node
#   2. keys generated for this node, router and operator
# The above two steps will be done manually by network installer
# when a new node is brought up.

# Need to adduser for nlsr
if [ ! -d /home/nlsr ]
then
  echo "Need to add user nlsr first."
  echo "try again after running:"
  echo "> adduser nlsr"
  exit 0
fi

sudo mkdir -p /etc/ndn/nlsr/keys
sudo mkdir -p /var/lib/ndn/nlsr
sudo mkdir -p /var/log/ndn/nlsr
sudo mkdir -p /var/lib/ndn/nfd-autoreg
sudo chown -R nlsr.nlsr /var/lib/ndn/nlsr /var/log/ndn/nlsr  /etc/ndn/nlsr
sudo chown -R ndn.ndn /var/lib/ndn/nfd-autoreg

