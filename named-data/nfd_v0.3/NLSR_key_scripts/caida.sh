#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/org/caida > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/org/caida/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/org/caida/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "CAIDA" -s /ndn -p /ndn/org/caida -r /home/nlsr/caida_unsigned_site.cert > /home/nlsr/caida_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/org/caida/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/org/caida/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "CAIDA Operator" -s /ndn/org/caida -p /ndn/org/caida/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/org/caida/%C1.Router/click > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "CAIDA Router click" -s /ndn/org/caida/%C1.Operator/ndnops -p /ndn/org/caida/%C1.Router/click -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
