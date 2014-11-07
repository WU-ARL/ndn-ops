#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/systemx > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/systemx/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/fr/systemx/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "SystemX" -s /ndn -p /ndn/fr/systemx -r /home/nlsr/systemx_unsigned_site.cert > /home/nlsr/systemx_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/systemx/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "SystemX Operator" -s /ndn/fr/systemx -p /ndn/fr/systemx/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/fr/systemx/%C1.Router/systemx-ndn-1 > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201410080000 -E 201510080000 -N "SystemX Router systemx-ndn-1" -s /ndn/fr/systemx/%C1.Operator/ndnops -p /ndn/fr/systemx/%C1.Router/systemx-ndn-1 -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
