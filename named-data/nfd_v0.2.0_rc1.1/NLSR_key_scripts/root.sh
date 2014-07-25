#!/bin/bash
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-sign-req /ndn > /home/nlsr/root.cert'

