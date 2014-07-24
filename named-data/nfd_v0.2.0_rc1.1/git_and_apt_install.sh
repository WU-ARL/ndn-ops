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

# set stuff up for NLSR
# We need 
#   1. A config file specific to this node
#   2. keys generated for this node, router and operator
# The above two steps will be done manually by network installer
# when a new node is brought up.

sudo mkdir -p /etc/ndn/nlsr/keys
sudo mkdir -p /var/lib/ndn/nlsr
