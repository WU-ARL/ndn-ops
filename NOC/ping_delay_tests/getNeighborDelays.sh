#!/bin/bash


LINKS=`grep face-uri /etc/ndn/nlsr/nlsr.conf | cut -d '/' -f 3 | cut -d ' ' -f 1`
PCOUNT=10
TCOUNT=40
QUIET=0
THISNODE="WU"
while [ $# -ge 1 ]
do
  if [ $1 = "-p" ]
  then
    PCOUNT=$2
    shift
    shift
  elif [ $1 = "-t" ]
    then
      TCOUNT=$2
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
      echo "Usage: $0 [-q] [-p #] [-t #] [-n <nodename>]"
      echo "Example: $0 -n WU         : to do a test with default settings from node WU"
      echo "Example: $0 -p 100        : to do a ping test with 100 pings per node pair and print out all ping results"
      echo "Example: $0 -t 20         : to do a traceroute test with a hop count of 20"
      echo "Example: $0 -q -p 100     : to do a test with 100 pings per node pair and print out just ping summary"
      echo "Example: $0               : default is a test with 10 pings per node pair and print out all ping results"
      exit
  fi
done

#echo "LINKS = $LINKS"

for l in $LINKS 
do

  echo " ----------------------------------"
  #echo "testing link $l"

  PRESULT=`ping -A -q  -c $PCOUNT $l`
  #ping -A -q  -c $PCOUNT $l

  if [ $? -eq 1 ]
  then
    echo "ping failed, try traceroute"
    TRESULT=`traceroute  -m $TCOUNT -T -p 6363 $l | tail -1`
    #echo $TRESULT
    TPROBES=`echo $TRESULT | cut -d ' ' -f 4,6,8`
    echo "$l: $TPROBES"
  else
    PMIN=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 1`
    PAVG=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 2`
    PMAX=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 3`
    PMDEV=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 4`
    echo "$l: MIN: $PMIN AVG: $PAVG MAX: $PMAX MDEV: $PMDEV"
  fi
  echo ""

done
