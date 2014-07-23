#!/bin/bash
ndnsec-key-gen -n /ndn/edu/ucla > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA" -s /ndn -p /ndn/edu/ucla -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/ucla/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA Operator" -s /ndn/edu/ucla -p /ndn/edu/ucla/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/ucla/%C1.Router/cs/spurs > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA Router spurs" -s /ndn/edu/ucla/%C1.Operator/ndnops -p /ndn/edu/ucla/%C1.Router/cs/spurs -r unsigned_router.cert > router.cert
