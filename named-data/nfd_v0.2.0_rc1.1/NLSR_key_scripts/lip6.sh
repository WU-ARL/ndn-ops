#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/edu/lip6 > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "LIP6" -s /ndn -p /ndn/fr/edu/lip6 -r /home/nlsr/lip6_unsigned_site.cert > /home/nlsr/lip6_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/edu/lip6/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "LIP6 Operator" -s /ndn/fr/edu/lip6 -p /ndn/fr/edu/lip6/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > ~nlsr/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/edu/lip6/%C1.Router/ndnhub > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "LIP6 Router ndnhub" -s /ndn/fr/edu/lip6/%C1.Operator/ndnops -p /ndn/fr/edu/lip6/%C1.Router/ndnhub -r ~nlsr/unsigned_router.cert > ~nlsr/router.cert'
