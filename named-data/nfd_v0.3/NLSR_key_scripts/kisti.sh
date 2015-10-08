#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/kr/re/kisti > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/kr/re/kisti/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/kr/re/kisti/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201506180000 -E 201810180000 -N "KISTI" -s /ndn -p /ndn/kr/re/kisti -r /home/nlsr/kisti_unsigned_site.cert > /home/nlsr/kisti_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/kr/re/kisti/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/kr/re/kisti/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201506180000 -E 201810180000 -N "KISTI Operator" -s /ndn/kr/re/kisti -p /ndn/kr/re/kisti/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/kr/re/kisti/%C1.Router/router3 > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201506180000 -E 201810180000 -N "KISTI Router router3" -s /ndn/kr/re/kisti/%C1.Operator/ndnops -p /ndn/kr/re/kisti/%C1.Router/router3 -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
