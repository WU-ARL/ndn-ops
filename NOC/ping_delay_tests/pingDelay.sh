#!/bin/bash


COUNT=10
QUIET=0
THISNODE="WU"
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
  elif [ $1 = "-n" ] 
    then
      THISNODE=$2
      shift
      shift
    else
      echo "Usage: $0 [-q] [-c #] [-n <nodename>]"
      echo "Example: $0 -n WU         : to do a test with default settings from node WU"
      echo "Example: $0 -c 100        : to do a test with 100 pings per node pair and print out all ping results"
      echo "Example: $0 -q -c 100     : to do a test with 100 pings per node pair and print out just ping summary"
      echo "Example: $0               : default is a test with 10 pings per node pair and print out all ping results"
      exit 
  fi
done

#echo "COUNT: $COUNT"
#echo "QUIET: $QUIET"

filename="node_list.txt"
while read -a LINE ;
do
  #echo "${LINE[0]} ${LINE[1]}"
  NODENAME=${LINE[0]}
  HOST=${LINE[1]}
  #echo "NODENAME=$NODENAME"
  #echo "HOST=$HOST"

  echo ""
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo ""
  echo "$THISNODE pinging $NODENAME $COUNT times with QUIET=$QUIET"
  if [ $QUIET -eq 1 ]
  then
    ping -q -c $COUNT $HOST
  else
    ping -c $COUNT $HOST
  fi

done < $filename
