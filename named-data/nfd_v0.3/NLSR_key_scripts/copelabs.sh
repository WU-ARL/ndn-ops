#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/pt/ulusofona/copelabs > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/pt/ulusofona/copelabs/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/pt/ulusofona/copelabs/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "COPELABS" -s /ndn -p /ndn/pt/ulusofona/copelabs -r /home/nlsr/copelabs_unsigned_site.cert > /home/nlsr/copelabs_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/pt/ulusofona/copelabs/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/pt/ulusofona/copelabs/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "COPELABS Operator" -s /ndn/pt/ulusofona/copelabs -p /ndn/pt/ulusofona/copelabs/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/pt/ulusofona/copelabs/%C1.Router/ndn > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "COPELABS Router ndn" -s /ndn/pt/ulusofona/copelabs/%C1.Operator/ndnops -p /ndn/pt/ulusofona/copelabs/%C1.Router/ndn -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
