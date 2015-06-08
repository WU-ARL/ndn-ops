#!/bin/bash


LINKS=`grep face-uri /etc/ndn/nlsr/nlsr.conf | cut -d '/' -f 3 | cut -d ' ' -f 1`
PCOUNT=10
TCOUNT=40
QUIET=0
THISNODE="WU"

DATE=`date +%d_%H.%M.%S`
LOGFILE="getNeighborDelays.$DATE"

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

echo "Testing Link delays from node $THISNODE" >& $LOGFILE

for l in $LINKS 
do

  echo " ----------------------------------" >> $LOGFILE
  #echo "testing link $l"

  PRESULT=`ping -A -q  -c $PCOUNT $l`
  #ping -A -q  -c $PCOUNT $l

  if [ $? -eq 1 ]
  then
    #echo "ping failed, try traceroute"
    #TRESULT=`traceroute  -m $TCOUNT -T -p 6363 $l | tail -1 | sed -e '/ \!H/s///g'`
    TRESULT=`sudo traceroute  -m $TCOUNT -T -p 6363 $l | tail -1 `
    echo "$TRESULT" | grep " \![HSPXVC]"  >& /dev/null
    if [ $? -eq 0 ]
    then
      echo "ping and traceroute failed, giving up on $THISNODE: NEIGHBOR $l" >> $LOGFILE
      echo "$TRESULT" >> $LOGFILE
    else
      #echo $TRESULT
      TP1=`echo $TRESULT | cut -d ' ' -f 4`
      TP2=`echo $TRESULT | cut -d ' ' -f 6`
      TP3=`echo $TRESULT | cut -d ' ' -f 8`
      TAVG=`echo "scale=3;($TP1 + $TP2 + $TP3)/3.0" | bc -l`
      TMIN=$TP1
      #echo "TMIN: $TMIN TP1: $TP1 TP2: $TP2 TP3: $TP3"
      BC_RESULT=`echo "$TMIN > $TP2" | bc -l`
      if [ $? -eq 1 ]
      then
        TMIN=$TP2
      fi
      BC_RESULT=`echo "$TMIN > $TP3" | bc -l`
      if  [ $BC_RESULT -eq 1 ]
      then
        TMIN=$TP3
      fi
      TMAX=$TP1
      BC_RESULT=`echo "$TMAX < $TP2" | bc -l`
      if  [ $? -eq 1 ]
      then
        TMAX=$TP2
      fi
      BC_RESULT=`echo "$TMAX < $TP3" | bc -l`
      if  [ $BC_RESULT -eq 1 ]
      then
        TMAX=$TP3
      fi
  
      #echo "NEIGHBOR $l: AVG: $AVG ($TP1 $TP2 $TP3)"
      echo "$THISNODE NEIGHBOR $l: MIN: $TMIN AVG: $TAVG MAX: $TMAX " >> $LOGFILE
    fi
  else
    PMIN=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 1`
    PAVG=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 2`
    PMAX=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 3`
    PMDEV=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 4`
    #echo "NEIGHBOR $l: MIN: $PMIN AVG: $PAVG MAX: $PMAX MDEV: $PMDEV"
    echo "$THISNODE NEIGHBOR $l: MIN: $PMIN AVG: $PAVG MAX: $PMAX " >> $LOGFILE
  fi
  echo "" >> $LOGFILE

done
