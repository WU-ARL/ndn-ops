#!/bin/bash

cd /home/ndnops/ndn-ops/NOC/test_scripts

PREFIXES=`cat prefixes.txt`

LAST_TIME_RUN=`cat LAST_RUN `
CURRENT_TIME=`date +%s`
timediff=`echo "$CURRENT_TIME-$LAST_TIME_RUN" | bc `
#echo "LAST_TIME_RUN - $CURRENT_TIME = $timediff"


# We want to run every 5 minutes. If it has been
# less than half of that, just exit and wait for next time cron runs us.
if [ $timediff -lt 150 ]
then
  exit 0
fi

echo "$CURRENT_TIME" > LAST_RUN

rm -f ndnping.log
echo -n "Start TIME: " > ndnping.log
date -u "+%Y/%m/%d %H:%M:%S" >> ndnping.log
for p in $PREFIXES
do

  #echo "Testing prefix: $p"
  ndnping -c 5 $p >> ndnping.log
done
echo -n "End TIME: " >> ndnping.log
date -u "+%Y/%m/%d %H:%M:%S">> ndnping.log
mv ndnping.log ndnping.log.export
