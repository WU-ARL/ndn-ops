#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/no/ntnu > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/no/ntnu/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/no/ntnu/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "NTNU" -s /ndn -p /ndn/no/ntnu -r /home/nlsr/ntnu_unsigned_site.cert > /home/nlsr/ntnu_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/no/ntnu/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "NTNU Operator" -s /ndn/no/ntnu -p /ndn/no/ntnu/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/no/ntnu/%C1.Router/ndnnode > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201610080000 -N "NTNU Router ndnnode" -s /ndn/no/ntnu/%C1.Operator/ndnops -p /ndn/no/ntnu/%C1.Router/ndnnode -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
