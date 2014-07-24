#!/bin/bash
ndnsec-key-gen -n /ndn/cn/edu/bupt > unsigned_site.cert

# this next step must take place on UCLA where the root cert is.
#ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT" -s /ndn -p /ndn/cn/edu/bupt -r unsigned_site.cert > site.cert

ndnsec-key-gen -n /ndn/cn/edu/bupt/%C1.Operator/ndnops > unsigned_operator.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT Operator" -s /ndn/cn/edu/bupt -p /ndn/cn/edu/bupt/%C1.Operator/ndnops -r unsigned_operator.cert > operator.cert
ndnsec-key-gen -n /ndn/cn/edu/bupt/%C1.Router/bupthub > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "BUPT Router bupthub" -s /ndn/cn/edu/bupt/%C1.Operator/ndnops -p /ndn/cn/edu/bupt/%C1.Router/bupthub -r unsigned_router.cert > router.cert
