#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/arizona > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA" -s /ndn -p /ndn/edu/arizona -r /home/nlsr/arizona_unsigned_site.cert > /home/nlsr/arizona_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/arizona/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA Operator" -s /ndn/edu/arizona -p /ndn/edu/arizona/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > ~nlsr/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/arizona/%C1.Router/hobo > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA Router hobo" -s /ndn/edu/arizona/%C1.Operator/ndnops -p /ndn/edu/arizona/%C1.Router/hobo -r ~nlsr/unsigned_router.cert > ~nlsr/router.cert'
