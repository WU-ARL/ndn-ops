#!/bin/bash

nrd_ready()
{
  RIB_INFO=`nfd-status -r`
  if [ $? -eq 0 ]
  then
    RETURN=0
  else
    RETURN=1
  fi

  RIB=`echo $RIB_INFO | cut -d':' -f 1`
  if [ "$RIB" = "Rib" -o "$RIB" = "RIB" ]
  then
      echo "READY"
  else
      echo "NOT READY"
  fi
}


count=0
while true
do
  ready=$(nrd_ready)
  if [  "$ready" = "READY" ]
  then
    echo "NRD is ready"
    exit 0
  else
    echo "NRD is NOT ready count = $count"
    count=$(($count+1))
  fi

done
