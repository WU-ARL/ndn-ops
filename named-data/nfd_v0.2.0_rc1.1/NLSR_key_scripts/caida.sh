#!/bin/bash
ndnsec-key-gen -n /ndn/org/caida > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CAIDA" -s /ndn -p /ndn/org/caida -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/org/caida/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CAIDA Operator" -s /ndn/org/caida -p /ndn/org/caida/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/org/caida/%C1.Router/click > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "CAIDA Router click" -s /ndn/org/caida/%C1.Operator/ndnops -p /ndn/org/caida/%C1.Router/click -r unsigned_router.cert > router.cert
