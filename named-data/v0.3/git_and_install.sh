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

git clone http://github.com/named-data/PyNDN

git clone http://github.com/named-data/OSPFN3.0
sudo adduser --disabled-login --gecos "" quagga

pushd /usr/local/etc/
sudo mkdir quagga
sudo chown quagga.quagga quagga
sudo chmod g+w quagga
popd

pushd /var/run
sudo mkdir quagga-state
sudo chown quagga.quagga quagga-state
sudo chmod g+w quagga-state
popd

pushd /var/log
sudo mkdir quagga
sudo chown quagga.quagga quagga
sudo chmod g+w quagga
sudo mkdir ospfnlog
popd

pushd OSPFN3.0
./configure --enable-opaque-lsa --disable-ipv6 --disable-ripd --disable-ripngd --disable-ospf6d --disable-bgpd --disable-bgp-announce --sysconfdir=/usr/local/etc/quagga --localstatedir=/var/run/quagga-state
make
sudo make install
# need to run ldconfig to get install libraries known
sudo ldconfig
popd

# install operator ndnsec tools:
git clone http://github.com/cawka/ndn-testbed-operator-tools
pushd ndn-testbed-operator-tools
sudo cp ndnop-process-requests /usr/local/bin
popd

# install ndnping and ndnpingserver
git clone http://github.com/named-data/ndnping
pushd ndnping
./bootstrap.sh 
./configure
make
sudo make install
popd

# install PyNDN (used for Memphis route status web page)
git clone http://github.com/named-data/PyNDN
pushd PyNDN
./bootstrap 
./configure --with-ndn="/usr/local"
make
make check
sudo make install
popd

