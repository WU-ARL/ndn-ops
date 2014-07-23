#!/bin/bash

# What we need for a Gateway Node:
#    ndn-cxx
#    nfd
#    ndn-tlv-ping
#    nlsr
#      configuration files for nlsr
#

sudo add-apt-repository ppa:named-data/ppa
sudo apt-get update
sudo apt-get install ndn-cxx nfd nlsr
sudo apt-get install ndn-cxx-dev
sudo apt-get install ndndump
sudo apt-get install ndn-tlv-ping
