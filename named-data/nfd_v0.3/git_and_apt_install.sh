#!/bin/bash

# What we need for a Gateway Node:
#    ndn-cxx
#    nfd
#    ndn-tlv-ping
#    nlsr
#      configuration files for nlsr
#    repo-ng
#    ndn-autoconfig-server
#
#    nfd-all covers a bunch of the above, just have to verify what exactly.

sudo add-apt-repository ppa:named-data/ppa
sudo apt-get -y update
sudo apt-get -y install ndn-cxx nfd nlsr
sudo apt-get -y install ndn-cxx-dev
sudo apt-get -y install ndndump
sudo apt-get -y install ndn-tlv-ping
sudo apt-get -y install repo-ng
sudo apt-get -y install ndn-autoconfig-server

git clone http://github.com/WU-ARL/ndnmap
pushd ndnmap/DataCollection
./waf configure
./waf
sudo ./waf install
popd
sudo mkdir -p /var/lib/ndn/ndnxmlstat_c
sudo chown ndn.ndn /var/lib/ndn/ndnxmlstat_c

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

sudo apt-get -y install python-pip 

sudo pip install requests

#git clone https://github.com/cawka/PyNDN2
git clone https://github.com/named-data/PyNDN2
cd PyNDN2
sudo python setup.py install

curl -O https://raw.githubusercontent.com/named-data/ndncert/master/ndnop-process-requests
chmod 755 ndnop-process-requests

# Optionally copy to a folder within $PATH. For example:
sudo mv ndnop-process-requests /usr/local/bin/


