#!/bin/bash


#PCOUNT=10
TCOUNT=40
QUIET=0
THISNODE="WU"


while [ $# -ge 1 ]
do
  #if [ $1 = "-p" ]
  #then
  #  PCOUNT=$2
  #  shift
  #  shift
  #elif [ $1 = "-t" ]
  if [ $1 = "-t" ]
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
      #echo "Example: $0 -p 100        : to do a ping test with 100 pings per node pair and print out all ping results"
      echo "Example: $0 -t 20         : to do a traceroute test with a hop count of 20"
      #echo "Example: $0 -q -p 100     : to do a test with 100 pings per node pair and print out just ping summary"
      #echo "Example: $0               : default is a test with 10 pings per node pair and print out all ping results"
      exit
  fi
done

DATE=`date +%Y_%m_%d`
DATE_AND_TIME=`date +%Y_%m_%d_%H.%M.%S`
LOGFILE="TESTBED_DELAYS/$THISNODE/getTestbedDelays.$DATE"
#echo "LOGFILE: $LOGFILE"
mkdir -p TESTBED_DELAYS/$THISNODE

touch $LOGFILE
echo "Testing Link delays from node $THISNODE at $DATE_AND_TIME" >> $LOGFILE

filename="full_node_list.txt"
while read -a LINE ;
do
  NODENAME=${LINE[0]}
  HOST=${LINE[1]}

  if [ "$THISNODE" = "$NODENAME" ]
  then
    continue
  fi

  echo " ----------------------------------" >> $LOGFILE

  #PRESULT=`ping -A -q  -c $PCOUNT $HOST`

  #if [ $? -eq 1 ]
  #then
    echo "trying traceroute: sudo traceroute -m $TCOUNT -f $TCOUNT -T -p 6363 $HOST | tail -1"
    FULL_TRESULT=`sudo traceroute  -m $TCOUNT -f $TCOUNT -T -p 6363 $HOST | tail -1 `
    TRESULT=`echo "$FULL_TRESULT" | cut -d '(' -f 2`
    echo "$TRESULT" | grep " \![HSPXVC]"  >& /dev/null
    if [ $? -eq 0 ]
    then
      #echo "ping and traceroute failed, giving up on $THISNODE: NEIGHBOR $HOST" >> $LOGFILE
      echo "$DATE_AND_TIME: traceroute failed, giving up on $THISNODE to $NODENAME($HOST)" >> $LOGFILE
      echo "" >> $LOGFILE
      #echo "$TRESULT" >> $LOGFILE
      continue
    else
      #echo "TRESULT: $TRESULT"
      echo "$TRESULT" | grep " \*"  >& /dev/null
      if [ $? -eq 0 ]
      then
        res="${TRESULT//[^*]}"
        #echo "res: $res"
        #echo "#res: ${#res}"
        #echo " ${#res}  star(s) found"
        STAR_COUNT=${#res}
        if [ $STAR_COUNT -eq 3 ]
        then
          echo "$DATE_AND_TIME: traceroute failed, giving up on $THISNODE to $NODENAME($HOST)" >> $LOGFILE
          echo "" >> $LOGFILE
          #echo "$TRESULT" >> $LOGFILE
          continue
        fi
        #echo ${TRESULT//'*'/10000 ms}
        #echo ${TRESULT//'*'/10000 ms}
        #TRESULT_SUB=${TRESULT//'*'/10000 ms}
        TRESULT_SUB=${TRESULT//'*'/}
        TRESULT="$TRESULT_SUB"
        #echo "after substitution TRESULT: $TRESULT"
        #TP1=`echo $TRESULT | cut -d ' ' -f 2`
        #TP2=`echo $TRESULT | cut -d ' ' -f 4`
        #TP3=`echo $TRESULT | cut -d ' ' -f 6`
      #else
        #echo "no star found"
        #TP1=`echo $TRESULT | cut -d ' ' -f 2`
        #TP2=`echo $TRESULT | cut -d ' ' -f 4`
        #TP3=`echo $TRESULT | cut -d ' ' -f 6`
      fi
      TP1=`echo $TRESULT | cut -d ' ' -f 2`
      TP2=`echo $TRESULT | cut -d ' ' -f 4`
      TP3=`echo $TRESULT | cut -d ' ' -f 6`
      #echo "TRESULT: $TRESULT"
      #echo "TP1: >$TP1<"
      #echo "TP2: >$TP2<"
      #echo "TP3: >$TP3<"
      SUM_STRING="0"
      COUNT=0
      if [ -n "$TP1" ]
      then
        SUM_STRING="$SUM_STRING + $TP1"
        COUNT=$(($COUNT+1))
      fi
      if [ -n "$TP2" ]
      then
        SUM_STRING="$SUM_STRING + $TP2"
        COUNT=$(($COUNT+1))
      fi
      if [ -n "$TP3" ]
      then
        SUM_STRING="$SUM_STRING + $TP3"
        COUNT=$(($COUNT+1))
      fi
      #TAVG=`echo "scale=3;($TP1 + $TP2 + $TP3)/3.0" | bc -l`
      if [ $COUNT -gt 0 ]
      then
        #echo "SUM_STRING: $SUM_STRING"
        #echo "COUNT: $COUNT"
        TAVG=`echo "scale=3;($SUM_STRING)/$COUNT" | bc -l`
        #echo "TAVG: $TAVG"
      else
        echo "No samples found, exit"
        exit
      fi
      TMIN=100000
      TMAX=0
      if [ -n "$TP1" ]
      then
        TMIN=$TP1
        TMAX=$TP1
      fi
      #echo "TMIN: $TMIN TP1: $TP1 TP2: $TP2 TP3: $TP3"
      if [ -n "$TP2" ]
      then
        BC_RESULT=`echo "$TMIN > $TP2" | bc -l`
        if [ $? -eq 1 ]
        then
          TMIN=$TP2
        fi
        BC_RESULT=`echo "$TMAX < $TP2" | bc -l`
        #echo "BC_RESULT: $BC_RESULT"
        if  [ $BC_RESULT -eq 1 ]
        then
          TMAX=$TP2
        fi
      fi
      if [ -n "$TP3" ]
      then
        BC_RESULT=`echo "$TMIN > $TP3" | bc -l`
        #echo "BC_RESULT: $BC_RESULT"
        if  [ $BC_RESULT -eq 1 ]
        then
          TMIN=$TP3
        fi
        BC_RESULT=`echo "$TMAX < $TP3" | bc -l`
        #echo "BC_RESULT: $BC_RESULT"
        if  [ $BC_RESULT -eq 1 ]
        then
          TMAX=$TP3
        fi
      fi
      #echo "TMIN: $TMIN"
      #echo "TMAX: $TMAX"

      #TMAX=$TP1
      #BC_RESULT=`echo "$TMAX < $TP2" | bc -l`
      #if  [ $? -eq 1 ]
      #then
      #  TMAX=$TP2
      #fi
      #BC_RESULT=`echo "$TMAX < $TP3" | bc -l`
      #echo "BC_RESULT: $BC_RESULT"
      #if  [ $BC_RESULT -eq 1 ]
      #then
      #  TMAX=$TP3
      #fi
  
      echo "$DATE_AND_TIME: traceroute: $THISNODE to $NODENAME/$HOST ($COUNT results, in ms): MIN: $TMIN AVG: $TAVG MAX: $TMAX " >> $LOGFILE
    fi
  #else
  #  PMIN=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 1`
  #  PAVG=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 2`
  #  PMAX=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 3`
  #  PMDEV=`echo $PRESULT | cut -d '/' -f 4-7 | cut -d ' ' -f 3 | cut -d '/' -f 4`
#
#    echo "ping: $THISNODE to remote $NODENAME/$HOST: MIN: $PMIN AVG: $PAVG MAX: $PMAX " >> $LOGFILE
#  fi
  echo "" >> $LOGFILE

done < $filename
