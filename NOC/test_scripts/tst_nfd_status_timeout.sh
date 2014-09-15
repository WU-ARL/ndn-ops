#!/bin/bash


bad_count=0
good_count=0
while true
do
  result=`nfd-status -f`
  #echo "result=$result"
  
  if [ -z "$result" ]
  then
    bad_count=$(($bad_count+1))
  else
    good_count=$(($good_count+1))
  fi
  echo "Bad: $bad_count Good: $good_count"
  if [ $good_count -eq 20 ]
  then
    exit 0
  fi

done
