#!/bin/bash


SERVER_PID=`ps auxwww | grep ndn-traffic-server | grep -v grep | awk '{print $2}'`

#echo "SERVER_PID=$SERVER_PID"
DATE=`date +%Y.%b.%d.%H.%M.%S`
LOGFILE=ndn-traffic-server.log.$DATE
#echo "LOGFILE=$LOGFILE"
HOSTNAME=`hostname`

if [ -z "$SERVER_PID" ]
then
  #echo "ndn-traffic-server not running, restart it"
  if [ "$HOSTNAME" = "wundngw" ]
  then
    #echo "WU"
    ndn-traffic-server -q ndn-traffic-server.conf.WU >& $LOGFILE &
  elif [ "$HOSTNAME" = "cs-ndn-testbed1.cs.unibas.ch" ]
    then
      #echo "BASEL"
      ndn-traffic-server -q ndn-traffic-server.conf.BASEL >& $LOGFILE &
  fi
#else
  #echo "ndn-traffic-server still running, PID=$SERVER_PID"
fi

