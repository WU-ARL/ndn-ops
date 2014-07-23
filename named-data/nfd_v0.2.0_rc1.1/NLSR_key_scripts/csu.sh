#!/bin/bash
ndnsec-key-gen -n /ndn/edu/colostate > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CSU" -s /ndn -p /ndn/edu/colostate -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/colostate/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CSU Operator" -s /ndn/edu/colostate -p /ndn/edu/colostate/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/colostate/%C1.Router/mccoy > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CSU Router mccoy" -s /ndn/edu/colostate/%C1.Operator/ndnops -p /ndn/edu/colostate/%C1.Router/mccoy -r unsigned_router.cert > router.cert
