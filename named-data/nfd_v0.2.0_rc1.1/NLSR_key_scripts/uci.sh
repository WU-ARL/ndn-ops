#!/bin/bash
ndnsec-key-gen -n /ndn/edu/uci > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCI" -s /ndn -p /ndn/edu/uci -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/uci/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCI Operator" -s /ndn/edu/uci -p /ndn/edu/uci/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/uci/%C1.Router/ndnhub > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCI Router ndnhub" -s /ndn/edu/uci/%C1.Operator/ndnops -p /ndn/edu/uci/%C1.Router/ndnhub -r unsigned_router.cert > router.cert
