#!/bin/bash
ndnsec-key-gen -n /ndn/edu/umich > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MICHIGAN" -s /ndn -p /ndn/edu/umich -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/umich/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MICHIGAN Operator" -s /ndn/edu/umich -p /ndn/edu/umich/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/umich/%C1.Router/ndn0 > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "MICHIGAN Router ndn0" -s /ndn/edu/umich/%C1.Operator/ndnops -p /ndn/edu/umich/%C1.Router/ndn0 -r unsigned_router.cert > router.cert
