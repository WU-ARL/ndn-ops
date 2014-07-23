#!/bin/bash
ndnsec-key-gen -n /ndn/edu/arizona > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA" -s /ndn -p /ndn/edu/arizona -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/arizona/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA Operator" -s /ndn/edu/arizona -p /ndn/edu/arizona/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/arizona/%C1.Router/hobo > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "ARIZONA Router hobo" -s /ndn/edu/arizona/%C1.Operator/ndnops -p /ndn/edu/arizona/%C1.Router/hobo -r unsigned_router.cert > router.cert
