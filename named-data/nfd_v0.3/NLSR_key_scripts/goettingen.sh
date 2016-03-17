#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/de/uni-goettingen > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/de/uni-goettingen/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/de/uni-goettingen/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "GOETTINGEN" -s /ndn -p /ndn/de/uni-goettingen -r /home/nlsr/goettingen_unsigned_site.cert > /home/nlsr/goettingen_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/de/uni-goettingen/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/de/uni-goettingen/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "GOETTINGEN Operator" -s /ndn/de/uni-goettingen -p /ndn/de/uni-goettingen/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/de/uni-goettingen/%C1.Router/ndntestbed > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "GOETTINGEN Router ndntestbed" -s /ndn/de/uni-goettingen/%C1.Operator/ndnops -p /ndn/de/uni-goettingen/%C1.Router/ndntestbed -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
