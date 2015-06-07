#!/bin/bash

# Do both pings and traceroutes, periodically to gather consensus.

# Initially focus on Anyang to BUPT (114.247.165.44)
# sudo traceroute -m 40 -T -p 6363 114.247.165.44
# ping 114.247.165.44

DATE=`date +%d_%H.%M.%S`
echo "$DATE"
LOGFILE="ping_traceroute_log.$DATE"
#exit

ping -A -q  -c 1000  114.247.165.44 > $LOGFILE
sudo traceroute -m 40 -T -p 6363 114.247.165.44 >> $LOGFILE
