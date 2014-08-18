#!/bin/bash

PREFIXES=`cat prefixes.txt`

rm -f ndnping.log
for p in $PREFIXES
do

  #echo "Testing prefix: $p"
  ndnping -c 5 $p >> ndnping.log
done
mv ndnping.log ndnping.log.export
