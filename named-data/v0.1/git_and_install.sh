#!/bin/bash

# What we need for a Gateway Node:
#    ndnx
#    OSPFN3.0
#      configuration files for OSPFN3.0
#

export  JAVA_HOME="/usr"

git clone http://github.com/named-data/ndnx
pushd ndnx
git checkout tags/v0.1
./configure
make
make test
sudo make install
popd

git clone http://github.com/named-data/OSPFN3.0
sudo addusr quagga
pushd /usr/local/etc/
sudo mkdir quagga
sudo chown quagga:quagga quagga
sudo chmod g+w quagga
popd
pushd /var/run
sudo mkdir quagga-state
sudo chown quagga:quagga quagga-state
sudo chmod g+w quagga-state
popd

pushd OSPFN3.0
./configure --enable-opaque-lsa --disable-ipv6 --disable-ripd --disable-ripngd --disable-ospf6d --disable-bgpd --disable-bgp-announce --sysconfdir=/usr/local/etc/quagga --localstatedir=/var/run/quagga-state
make
sudo make install

