#!/bin/bash

#Separate operator on aleph?
# This happens on aleph
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/%C1.Operator/remap-ndnops > /home/nlsr/unsigned_operator.cert'
# This happens on spurs
#sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA Operator" -s /ndn/edu/ucla -p /ndn/edu/ucla/%C1.Operator/remap-ndnops -r /home/nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/%C1.Router/cs/aleph > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA Router aleph" -s /ndn/edu/ucla/%C1.Operator/remap-ndnops -p /ndn/edu/ucla/%C1.Router/cs/aleph -r unsigned_router.cert > ~nlsr/router.cert'

# Then move router.cert back to aleph
