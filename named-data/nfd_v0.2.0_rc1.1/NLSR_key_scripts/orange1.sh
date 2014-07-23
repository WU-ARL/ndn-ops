#!/bin/bash
ndnsec-key-gen -n /ndn/fr/orange1 > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ORANGE" -s /ndn -p /ndn/fr/orange1 -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/fr/orange1/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ORANGE Operator" -s /ndn/fr/orange1 -p /ndn/fr/orange1/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/fr/orange1/%C1.Router/orange-ndn-1 > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ORANGE Router orange-ndn-1" -s /ndn/fr/orange1/%C1.Operator/ndnops -p /ndn/fr/orange1/%C1.Router/orange-ndn-1 -r unsigned_router.cert > router.cert
