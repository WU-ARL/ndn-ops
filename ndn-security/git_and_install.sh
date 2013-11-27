#!/bin/bash

# What we need for a NDN Security:
#    Assume ndnx is already installed
#
#    python-ndn-exp
#    ndn.cxx-dev 
#    ndn.cxx-security-tools 
#    ndn-testbed-operator-tools

#git clone https://github.com/named-data/ndn.cxx.git
#
#git clone https://github.com/named-data/ndnx.cxx-security-tools.git

# python-ndn-exp
sudo add-apt-repository -y ppa:named-data/ppa
sudo apt-get update
sudo apt-get -y install ndn.cxx-dev ndn.cxx-security-tools python-ndn-exp



# install operator ndnsec tools:
git clone http://github.com/cawka/ndn-testbed-operator-tools
pushd ndn-testbed-operator-tools
sudo cp ndnop-process-requests /usr/local/bin

