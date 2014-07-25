#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/bupt > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT" -s /ndn -p /ndn/cn/edu/bupt -r bupt_unsigned_site.cert > /home/nlsr/site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/bupt/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT Operator" -s /ndn/cn/edu/bupt -p /ndn/cn/edu/bupt/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > ~nlsr/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/bupt/%C1.Router/bupthub > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT Router bupthub" -s /ndn/cn/edu/bupt/%C1.Operator/ndnops -p /ndn/cn/edu/bupt/%C1.Router/bupthub -r ~nlsr/unsigned_router.cert > ~nlsr/router.cert'
