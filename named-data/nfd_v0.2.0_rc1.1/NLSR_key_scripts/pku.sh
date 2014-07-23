#!/bin/bash
ndnsec-key-gen -n /ndn/cn/edu/pku > unsigned_site.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "PKU" -s /ndn -p /ndn/cn/edu/pku -r unsigned_site.cert > site.cert
ndnsec-key-gen -n /ndn/cn/edu/pku/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "PKU Operator" -s /ndn/cn/edu/pku -p /ndn/cn/edu/pku/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/cn/edu/pku/%C1.Router/pkuhub > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "PKU Router pkuhub" -s /ndn/cn/edu/pku/%C1.Operator/ndnops -p /ndn/cn/edu/pku/%C1.Router/pkuhub -r unsigned_router.cert > router.cert
