#!/bin/bash
ndnsec-key-gen -n /ndn/edu/wustl > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "WU" -s /ndn -p /ndn/edu/wustl -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/wustl/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "WU Operator" -s /ndn/edu/wustl -p /ndn/edu/wustl/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/wustl/%C1.Router/wundngw > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "WU Router wundngw" -s /ndn/edu/wustl/%C1.Operator/ndnops -p /ndn/edu/wustl/%C1.Router/wundngw -r unsigned_router.cert > router.cert
