#!/bin/bash

pushd ndn-cpp-dev
git pull
./waf clean
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

pushd ndnd-tlv
git pull
./waf clean
./waf configure
./waf
sudo ./waf install
sudo ldconfig
popd

