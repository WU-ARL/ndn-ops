#!/bin/bash

# What we need for a Gateway Node:
#    ndnx
#    OSPFN3.0
#      configuration files for OSPFN3.0
#

export  JAVA_HOME="/usr"

git clone http://github.com/named-data/ndnx
pushd ndnx
git checkout tags/v0.3
./configure
make
make test
sudo make install
# need to run ldconfig to get install libraries known
sudo ldconfig
sudo mkdir -p /usr/local/etc/ndnx
sudo mkdir -p /var/log/ndnx
popd

git clone http://github.com/named-data/ndn-cpp-dev
pushd ndn-cpp-dev
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

# no tags used in ndnd-tlv code, so just go with latest version
git clone http://github.com/named-data/ndnd-tlv
pushd ndnd-tlv
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

git clone http://github.com/named-data/PyNDN2
pushd PyNDN2
git checkout tags/v2.0alpha2
# put PyNDN2 into python path for later packages in this script to use
export PYTHONPATH=/home/ndnops/ndn-ops/named-data/v0.3/PyNDN2/python/:$PYTHONPATH
popd



git clone http://github.com/named-data/OSPFN3.0
# add check for user quagga before trying to add
if [ -d /home/quagga ]
then
  echo "user quagga already exists"
else
  echo "user quagga does NOT already exists"
  sudo adduser --disabled-login --gecos "" quagga
fi


pushd /usr/local/etc/
sudo mkdir -p quagga
sudo chown quagga.quagga quagga
sudo chmod g+w quagga
popd

pushd /var/run
sudo mkdir -p quagga-state
sudo chown quagga.quagga quagga-state
sudo chmod g+w quagga-state
popd

pushd /var/log
sudo mkdir -p quagga
sudo chown quagga.quagga quagga
sudo chmod g+w quagga
sudo mkdir -p ospfnlog
popd

pushd OSPFN3.0
./configure --enable-opaque-lsa --disable-ipv6 --disable-ripd --disable-ripngd --disable-ospf6d --disable-bgpd --disable-bgp-announce --sysconfdir=/usr/local/etc/quagga --localstatedir=/var/run/quagga-state
make
sudo make install
# need to run ldconfig to get install libraries known
sudo ldconfig
popd

## install operator ndnsec tools:
#git clone http://github.com/cawka/ndn-testbed-operator-tools
#pushd ndn-testbed-operator-tools
#sudo cp ndnop-process-requests /usr/local/bin
#popd

# install ndnping and ndnpingserver
git clone http://github.com/named-data/ndnping
pushd ndnping
./bootstrap.sh 
./configure
make
sudo make install
popd

# install boost 1.55
wget http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.gz
tar -xzf boost_1_55_0.tar.gz 
pushd boost_1_55_0/
./bootstrap.sh
./b2 
sudo ./b2 install
sudo ldconfig
popd

#
git clone http://github.com/named-data/wsproxy-cpp
pushd wsproxy-cpp
git submodule init
git submodule update
# boost.py.update gives a different order of paths for libs and includes
# boost lib installed above is going into /usr/local so we want that first
mv waf-tools/boost.py waf-tools/boost.py.ORIG
cp -p ../boost.py.updated waf-tools/boost.py
./waf configure
./waf
sudo ./waf install
popd
#

