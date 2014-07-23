#!/bin/bash
ndnsec-key-gen -n /ndn/fr/lip6 > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "LIP6" -s /ndn -p /ndn/fr/lip6 -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/fr/lip6/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "LIP6 Operator" -s /ndn/fr/lip6 -p /ndn/fr/lip6/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/fr/lip6/%C1.Router/ndnhub > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "LIP6 Router ndnhub" -s /ndn/fr/lip6/%C1.Operator/ndnops -p /ndn/fr/lip6/%C1.Router/ndnhub -r unsigned_router.cert > router.cert
