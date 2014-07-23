#!/bin/bash
ndnsec-key-gen -n /ndn/edu/neu > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "NEU" -s /ndn -p /ndn/edu/neu -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/neu/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "NEU Operator" -s /ndn/edu/neu -p /ndn/edu/neu/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/neu/%C1.Router/ndnrtr > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "NEU Router ndnrtr" -s /ndn/edu/neu/%C1.Operator/ndnops -p /ndn/edu/neu/%C1.Router/ndnrtr -r unsigned_router.cert > router.cert
