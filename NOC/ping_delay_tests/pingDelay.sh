#!/bin/bash


COUNT=10
QUIET=0
while [ $# -ge 1 ] 
do
  if [ $1 = "-c" ] 
  then
    COUNT=$2
    shift
    shift
  elif [ $1 = "-q" ] 
    then
      QUIET=1
      shift
    else
      echo "Usage: $0 [-q] [-c #]"
      echo "Example: $0 -c 100        : to do a test with 100 pings per node pair and print out all ping results"
      echo "Example: $0 -q -c 100     : to do a test with 100 pings per node pair and print out just ping summary"
      echo "Example: $0               : default is a test with 10 pings per node pair and print out all ping results"
      exit 
  fi
done

echo "COUNT: $COUNT"
echo "QUIET: $QUIET"


