#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/orange > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "ORANGE1" -s /ndn -p /ndn/com/orange -r /home/nlsr/orange_unsigned_site.cert > /home/nlsr/orange_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/orange/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "ORANGE1 Operator" -s /ndn/com/orange -p /ndn/com/orange/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/orange/%C1.Router/orange-ndn-1 > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "ORANGE1 Router orange-ndn-1" -s /ndn/com/orange/%C1.Operator/ndnops -p /ndn/com/orange/%C1.Router/orange-ndn-1 -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
