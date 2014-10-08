#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/neu > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "NEU" -s /ndn -p /ndn/edu/neu -r /home/nlsr/neu_unsigned_site.cert > /home/nlsr/neu_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/neu/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "NEU Operator" -s /ndn/edu/neu -p /ndn/edu/neu/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/neu/%C1.Router/ndnrtr > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "NEU Router ndnrtr" -s /ndn/edu/neu/%C1.Operator/ndnops -p /ndn/edu/neu/%C1.Router/ndnrtr -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
