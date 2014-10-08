#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uiuc > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC" -s /ndn -p /ndn/edu/uiuc -r /home/nlsr/uiuc_unsigned_site.cert > /home/nlsr/uiuc_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uiuc/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC Operator" -s /ndn/edu/uiuc -p /ndn/edu/uiuc/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > ~nlsr/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uiuc/%C1.Router/ndnx > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UIUC Router ndnx" -s /ndn/edu/uiuc/%C1.Operator/ndnops -p /ndn/edu/uiuc/%C1.Router/ndnx -r ~nlsr/unsigned_router.cert > ~nlsr/router.cert'
