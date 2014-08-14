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

while true
do
    DATE=`date +%Y%m%d%H%M%S`
    ./checkFIB.sh $LOCAL_NAME >& checkFIB.out.${LOCAL_NAME}.${DATE}
    
    sleep 60
done

