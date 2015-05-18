#!/bin/bash


COUNT=10
THISNODE="WU"
while [ $# -ge 1 ] 
do
  if [ $1 = "-c" ] 
  then
    COUNT=$2
    shift
    shift
  elif [ $1 = "-n" ] 
    then
      THISNODE=$2
      shift
      shift
    else
      echo "Usage: $0 [-c #] [-n <nodename>]"
      echo "Example: $0 -n WU         : to do a traceroute test with default settings from node WU"
      echo "Example: $0 -c 100        : to do a traceroute test with 100 hops "
      echo "Example: $0               : default is a test with 40 hops from WU"
      exit 
  fi
done

#echo "COUNT: $COUNT"

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
  echo "$THISNODE traceroute to  $NODENAME hopcount: $COUNT "
  traceroute  -m $COUNT -T -p 6363 $HOST

done < $filename
