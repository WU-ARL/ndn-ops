#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/es/urjc > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "URJC" -s /ndn -p /ndn/es/urjc -r /home/nlsr/urjc_unsigned_site.cert > /home/nlsr/urjc_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/es/urjc/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/es/urjc/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "URJC Operator" -s /ndn/es/urjc -p /ndn/es/urjc/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/es/urjc/%C1.Router/insula > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "URJC Router insula" -s /ndn/es/urjc/%C1.Operator/ndnops -p /ndn/es/urjc/%C1.Router/insula -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
