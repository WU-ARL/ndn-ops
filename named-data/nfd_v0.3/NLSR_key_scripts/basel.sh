#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/ch/unibas > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/ch/unibas/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/ch/unibas/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "BASEL" -s /ndn -p /ndn/ch/unibas -r /home/nlsr/basel_unsigned_site.cert > /home/nlsr/basel_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/ch/unibas/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/ch/unibas/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "BASEL Operator" -s /ndn/ch/unibas -p /ndn/ch/unibas/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/ch/unibas/%C1.Router/dmi-ndn-testbed1 > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "BASEL Router dmi-ndn-testbed1" -s /ndn/ch/unibas/%C1.Operator/ndnops -p /ndn/ch/unibas/%C1.Router/dmi-ndn-testbed1 -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
