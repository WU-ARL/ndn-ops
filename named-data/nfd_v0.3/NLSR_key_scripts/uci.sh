#!/bin/bash
# point home to /var/lib/ndn/nlsr so keys will be stored there.
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uci > ~nlsr/unsigned_site.cert'

# seems that now we have to set a default identity:
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uci/nlsr > ~nlsr/unsigned_nlsr.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/edu/uci/nlsr'

# this next step must take place on UCLA where the root cert is.
# sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "UCI" -s /ndn -p /ndn/edu/uci -r /home/nlsr/uci_unsigned_site.cert > /home/nlsr/uci_site.cert'

sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uci/%C1.Operator/ndnops > ~nlsr/unsigned_operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-set-default -n /ndn/edu/uci/nlsr'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "UCI Operator" -s /ndn/edu/uci -p /ndn/edu/uci/%C1.Operator/ndnops -r ~nlsr/unsigned_operator.cert > /etc/ndn/nlsr/keys/operator.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-key-gen -n /ndn/edu/uci/%C1.Router/ndnhub > ~nlsr/unsigned_router.cert'
sudo su - nlsr -c 'export HOME=/var/lib/ndn/nlsr/; ndnsec-cert-gen -S 201507080000 -E 201810080000 -N "UCI Router ndnhub" -s /ndn/edu/uci/%C1.Operator/ndnops -p /ndn/edu/uci/%C1.Router/ndnhub -r ~nlsr/unsigned_router.cert > /etc/ndn/nlsr/keys/router.cert'
