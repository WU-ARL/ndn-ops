#!/bin/bash
ndnsec-key-gen -n /ndn/edu/ucla/%C1.Router/cs/aleph > unsigned_router.cert
ndnsec-cert-gen -S 201407080000 -E 201507080000 -N "UCLA Router aleph" -s /ndn/edu/ucla/%C1.Operator/ndnops -p /ndn/edu/ucla/%C1.Router/cs/aleph -r unsigned_router.cert > router.cert