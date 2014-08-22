#!/bin/bash

cd /home/ndnops/ndn-ops/NOC/test_scripts

PREFIXES=`cat prefixes.txt`


rm -f ndnping.log
date > ndnping.log
for p in $PREFIXES
do

  #echo "Testing prefix: $p"
  ndnping -c 5 $p >> ndnping.log
done
mv ndnping.log ndnping.log.export
