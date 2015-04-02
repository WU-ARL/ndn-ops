#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/verisign > ~nlsr/unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "VERISIGN" -s /ndn -p /ndn/com/verisign -r /home/nlsr/verisign_unsigned_site.cert > /home/nlsr/verisign_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/verisign/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/com/verisign/nlsr'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "VERISIGN Operator" -s /ndn/com/verisign -p /ndn/com/verisign/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/com/verisign/%C1.Router/labs-ndn3 > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "VERISIGN Router labs-ndn3" -s /ndn/com/verisign/%C1.Operator/ndnops -p /ndn/com/verisign/%C1.Router/labs-ndn3 -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
