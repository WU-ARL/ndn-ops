#!/bin/bash


ID=` sudo su - ndnsec -c "ndnsec-ls-identity -C" | grep "^*" | cut -d' ' -f 2`
#echo "ID=$ID"

sudo su - ndnsec -c "ndnsec-cert-dump -p -i $ID >& ~ndnsec/default.ndncert"
sudo su - ndnsec -c "chmod 440 ~ndnsec/default.ndncert"
sudo mkdir /etc/ndn/keys
sudo cp ~ndnsec/default.ndncert /etc/ndn/keys
