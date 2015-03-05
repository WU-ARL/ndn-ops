#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/pku > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "PKU" -s /ndn -p /ndn/cn/edu/pku -r /home/nlsr/pku_unsigned_site.cert > /home/nlsr/pku_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/pku/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "PKU Operator" -s /ndn/cn/edu/pku -p /ndn/cn/edu/pku/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/cn/edu/pku/%C1.Router/pkuhub > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "PKU Router pkuhub" -s /ndn/cn/edu/pku/%C1.Operator/ndnops -p /ndn/cn/edu/pku/%C1.Router/pkuhub -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
