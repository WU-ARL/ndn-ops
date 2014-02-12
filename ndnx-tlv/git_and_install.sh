#!/bin/bash

git clone http://github.com/named-data/ndn-cpp-dev
pushd ndn-cpp-dev
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

git clone http://github.com/named-data/ndnd-tlv
pushd ndnd-tlv
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

