#!/bin/bash

nfd_ready()
{
  FIB_INFO=`nfd-status -b`
  if [ $? -eq 0 ]
  then
    RETURN=0
  else
    RETURN=1
  fi

  FIB=`echo $FIB_INFO | cut -d':' -f 1`
  if [ "$FIB" = "FIB" ]
  then
      echo "READY"
  else
      echo "NOT READY"
  fi
}


count=0

while true
do
  ready=$(nfd_ready)
  if [  "$ready" = "READY" ]
  then
    echo "NFD is ready"
    exit 0
  else
    echo "NFD is NOT ready count = $count"
    count=$(($count+1))
  fi

done
