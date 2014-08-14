#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: $0 local_name"
  echo "NAMES: $NAMES"
  exit 0
else
  LOCAL_NAME=$1
fi

DATE=`date +%Y%m%d%H%M%S`


tar -czf $LOCAL_NAME.$DATE.logs.tgz /var/log/ndn/nfd.log /var/log/ndn/nrd.log /var/log/ndn/nlsr/nlsr.log /var/log/ndn/nlsr/nlsr_.log checkRIB.out.*

