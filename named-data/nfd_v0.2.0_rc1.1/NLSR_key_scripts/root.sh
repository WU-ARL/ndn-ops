#!/bin/bash
ndnsec-key-gen -n /ndn
ndnsec-sign-req /ndn > root.cert

