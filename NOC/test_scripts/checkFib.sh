#!/bin/bash

neighborFaces=`ndndstatus | grep "10\.0" | cut -d ' ' -f 3`
broadcastFaces=`ndndstatus | grep broad | cut -d ' ' -f 4`
keysFaces=`ndndstatus | grep keys | cut -d ' ' -f 4`

#echo "neighborFaces = $neighborFaces"
#echo "broadcastFaces = $broadcastFaces"

for n in $neighborFaces 
do
  found=false
  for b in $broadcastFaces
  do
    if [ "$n" =  "$b" ]
    then
      found=true
      break
    fi
  done
  if ! $found 
  then
    echo "face $n did not have FIB entry for /ndn/broadcast "
  else
    echo "face $n did     have FIB entry for /ndn/broadcast "
  fi
done

for n in $neighborFaces 
do
  found=false
  for b in $keysFaces
  do
    if [ "$n" =  "$b" ]
    then
      found=true
      break
    fi
  done
  if ! $found 
  then
    echo "face $n did not have FIB entry for /ndn/keys "
  else
    echo "face $n did     have FIB entry for /ndn/keys "
  fi
done

