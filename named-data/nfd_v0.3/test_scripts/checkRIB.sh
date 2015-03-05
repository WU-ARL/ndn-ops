#!/bin/bash

NAMES="bupt pku tongji arizona colostate memphis neu uci ucla remap uiuc umich wustl lip6 orange1 caida"

if [ $# -ne 1 ]
then
  echo "Usage: $0 local_name"
  echo "NAMES: $NAMES"
  exit 0
else
  LOCAL_NAME=$1
fi

date
nfd-status > /tmp/nfd_status.out

for n in $NAMES
do

  grep "$n " /tmp/nfd_status.out | grep route
  if (($? > 0)) ; 
  then
    if [ "$n" != "$LOCAL_NAME" ]
    then
      echo "missing $n"
    fi
  fi
done

