#!/bin/bash
ndnsec-key-gen -n /ndn/edu/uiuc > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UIUC" -s /ndn -p /ndn/edu/uiuc -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/edu/uiuc/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UIUC Operator" -s /ndn/edu/uiuc -p /ndn/edu/uiuc/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/edu/uiuc/%C1.Router/ndnx > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UIUC Router ndnx" -s /ndn/edu/uiuc/%C1.Operator/ndnops -p /ndn/edu/uiuc/%C1.Router/ndnx -r unsigned_router.cert > router.cert
