#!/bin/bash


COUNT=5
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
      echo "Example: $0 -c 20         : to do an ndnping test with a ping count of 20"
      exit
  fi
done

DATE=`date -u +%Y_%m_%d`
DATE_AND_TIME_UTC=`date -u`
LOGFILE="TESTBED_DELAYS/$THISNODE/getTestbedDelays_ndnping.$DATE"
mkdir -p TESTBED_DELAYS/$THISNODE

touch $LOGFILE
echo "Testing delays with ndnping from node $THISNODE at $DATE_AND_TIME_UTC" >> $LOGFILE

filename="full_prefix_list.txt"
while read -a LINE ;
do
  NODENAME=${LINE[0]}
  PREFIX=${LINE[1]}

  if [ "$THISNODE" = "$NODENAME" ]
  then
    continue
  fi

  echo " ----------------------------------" >> $LOGFILE


  #FULL_RESULT=`ndnping -c $COUNT $PREFIX | tail -3 `
  ndnping -c $COUNT $PREFIX >> ${LOGFILE}.ndnping
  LINE1=`tail -3 ${LOGFILE}.ndnping | head -1`
  LINE2=`tail -2 ${LOGFILE}.ndnping | head -1`
  LINE3=`tail -1 ${LOGFILE}.ndnping `
  #echo "LINE1: $LINE1"
  #echo "LINE2: $LINE2"
  #echo "LINE3: $LINE3"
  echo $LINE2 | grep received >& /dev/null
  if [ $? -eq 0 ]
  then
    # some success
    RECEIVED=`echo $LINE2 | cut -d ' ' -f 4`
    PMIN=`echo $LINE3 | cut -d ' ' -f 4 | cut -d '/' -f 1`
    PAVG=`echo $LINE3 | cut -d ' ' -f 4 | cut -d '/' -f 2`
    PMAX=`echo $LINE3 | cut -d ' ' -f 4 | cut -d '/' -f 3`
    echo "$DATE_AND_TIME_UTC: ndnping $THISNODE to $NODENAME ($PREFIX): received $RECEIVED out of $COUNT, MIN: $PMIN AVG: $PAVG MAX: $PMAX" >> $LOGFILE
  else
    # no success
    echo "$DATE_AND_TIME_UTC: ndnping $THISNODE to $NODENAME ($PREFIX): received 0 out of $COUNT" >> $LOGFILE
  fi

  echo "" >> $LOGFILE

done < $filename
