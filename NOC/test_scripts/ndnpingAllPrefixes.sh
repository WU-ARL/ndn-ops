#!/bin/bash

PREFIXES=`cat prefixes.txt`

for p in $PREFIXES
do

  echo "Testing prefix: $p"
  ndnping -c 5 $p
done
