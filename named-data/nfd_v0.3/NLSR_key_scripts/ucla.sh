#!/bin/bash
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla > /home/nlsr/ucla_unsigned_site.cert'

# this next step must take place on UCLA where the root cert is.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UCLA" -s /ndn -p /ndn/edu/ucla -r /home/nlsr/ucla_unsigned_site.cert > /etc/ndn/nlsr/keys/site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/%C1.Operator/ndnops > /home/nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/edu/ucla/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UCLA Operator" -s /ndn/edu/ucla -p /ndn/edu/ucla/%C1.Operator/ndnops -r /home/nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/ucla/%C1.Router/cs/spurs > /home/nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "UCLA Router spurs" -s /ndn/edu/ucla/%C1.Operator/ndnops -p /ndn/edu/ucla/%C1.Router/cs/spurs -r /home/nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
