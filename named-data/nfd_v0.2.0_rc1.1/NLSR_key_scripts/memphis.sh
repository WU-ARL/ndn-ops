#!/bin/bash
ndnsec-key-gen -n /ndn/edu/memphis > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MEMPHIS" -s /ndn -p /ndn/edu/memphis -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/memphis/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MEMPHIS Operator" -s /ndn/edu/memphis -p /ndn/edu/memphis/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/memphis/%C1.Router/titan > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MEMPHIS Router titan" -s /ndn/edu/memphis/%C1.Operator/ndnops -p /ndn/edu/memphis/%C1.Router/titan -r unsigned_router.cert > router.cert
