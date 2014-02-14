#!/bin/bash

# What we need for a Gateway Node:
#    ndnx
#    OSPFN3.0
#      configuration files for OSPFN3.0
#

export  JAVA_HOME="/usr"

pushd ndnx
git pull
git checkout tags/v0.2
make clean
./configure
make
make test
sudo make install
# need to run ldconfig to get install libraries known
sudo ldconfig
sudo mkdir -p /usr/local/etc/ndnx
sudo mkdir -p /var/log/ndnx
popd

pushd PyNDN
git pull
popd


pushd OSPFN3.0
git pull
make clean
./configure --enable-opaque-lsa --disable-ipv6 --disable-ripd --disable-ripngd --disable-ospf6d --disable-bgpd --disable-bgp-announce --sysconfdir=/usr/local/etc/quagga --localstatedir=/var/run/quagga-state
make
sudo make install
# need to run ldconfig to get install libraries known
sudo ldconfig
popd

# install operator ndnsec tools:
pushd ndn-testbed-operator-tools
git pull
sudo cp ndnop-process-requests /usr/local/bin
popd

# install ndnping and ndnpingserver
pushd ndnping
git pull
make clean
./bootstrap.sh 
./configure
make
sudo make install
popd

# install PyNDN (used for Memphis route status web page)
pushd PyNDN
git pull
make clean
./bootstrap 
./configure --with-ndn="/usr/local"
make
make check
sudo make install
popd

