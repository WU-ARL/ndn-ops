#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/illinois > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC" -s /ndn -p /ndn/edu/illinois -r /home/nlsr/illinois_unsigned_site.cert > /home/nlsr/illinois_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/illinois/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/edu/illinois/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC Operator" -s /ndn/edu/illinois -p /ndn/edu/illinois/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/illinois/%C1.Router/ndnx > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC Router ndnx" -s /ndn/edu/illinois/%C1.Operator/ndnops -p /ndn/edu/illinois/%C1.Router/ndnx -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
