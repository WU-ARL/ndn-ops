#!/bin/bash

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/remap/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/edu/ucla/remap/nlsr'

# This happens on aleph
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/%C1.Router/cs/aleph > ~nlsr/unsigned_router.cert'

# This happens on spurs
#sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "UCLA Router aleph" -s /ndn/edu/ucla/%C1.Operator/ndnops -p /ndn/edu/ucla/%C1.Router/cs/aleph -r ~nlsr/remap_unsigned_router.cert > ~nlsr/remap_router.cert'

# Then move router.cert back to aleph
