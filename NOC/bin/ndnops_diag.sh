#!/bin/bash

export LC_ALL=en_US.utf-8

if [ $# -eq 1 ]
then
  NAME=$1
  OUTPUT_FILE="/home/ndnops/ndn-ops/NOC/bin/ndnops_diag.log"
else
  if [ $# -eq 2 ]
  then
    NAME=$1
    OUTPUT_FILE=$2
  
  else
    NAME="UNKNOWN"
    OUTPUT_FILE="/home/ndnops/ndn-ops/NOC/bin/ndnops_diag.log"
  fi
fi

DATE=`date -u` 

KERNEL=`uname -a | cut -d ' ' -f 3`
OS_VERSION=`grep "VERSION=" /etc/os-release  | cut -d'"' -f 2 | cut -d ',' -f 1`
UPTIME=`uptime | cut -d 'p' -f 2 | cut -d ',' -f 1,2`
RESTART_REQUIRED_TEXT=`grep "System restart required" /etc/motd`
if [ -z "$RESTART_REQUIRED_TEXT" ]
then
  RESTART_REQUIRED="N"
else
  RESTART_REQUIRED="Y"
fi

NFD_VSIZE=`ps alx | sed -n '/\/usr\/bin\/nfd /s/ \+/ /gp' | cut -d ' ' -f 7`
NFD_PID=`ps alx | sed -n '/\/usr\/bin\/nfd /s/ \+/ /gp' | cut -d ' ' -f 3`
NFD_LOGFILE_SIZE=`du -sh /var/log/ndn/nfd.log | cut -d '	' -f 1`
read ROOT_DISK_SIZE ROOT_DISK_USED ROOT_DISK_AVAIL ROOT_DISK_AVAIL_PERCENT <<< $(df -h / | grep -v Filesystem | sed -n '/ /s/ \+/ /gp' | cut -d ' ' -f 2,3,4,5)
read BOOT_DISK_SIZE BOOT_DISK_USED BOOT_DISK_AVAIL BOOT_DISK_AVAIL_PERCENT <<< $(df -h /boot | grep -v Filesystem | sed -n '/ /s/ \+/ /gp' | cut -d ' ' -f 2,3,4,5)
NUM_NFD_STATUS_PROCS=`ps auxwww | grep "nfd-status -x" | grep -v grep  | wc -l`

#echo "NFD_PID=$NFD_PID" >> $OUTPUT_FILE
#echo "NFD_VSIZE=$NFD_VSIZE" >> $OUTPUT_FILE
#echo "NFD_LOGFILE_SIZE=$NFD_LOGFILE_SIZE" >> $OUTPUT_FILE
#echo "ROOT_DISK_SIZE=$ROOT_DISK_SIZE" >> $OUTPUT_FILE
#echo "ROOT_DISK_USED=$ROOT_DISK_USED" >> $OUTPUT_FILE
#echo "ROOT_DISK_AVAIL=$ROOT_DISK_AVAIL" >> $OUTPUT_FILE

echo "<tr>" > $OUTPUT_FILE
echo "<td width = 80px;>$NAME</td>" >> $OUTPUT_FILE
echo "<td>$DATE</td>" >> $OUTPUT_FILE
echo "<td>$OS_VERSION</td>" >> $OUTPUT_FILE
echo "<td>$KERNEL</td>" >> $OUTPUT_FILE
echo "<td>$UPTIME</td>" >> $OUTPUT_FILE
echo "<td>$RESTART_REQUIRED</td>" >> $OUTPUT_FILE
echo "<td>$NFD_PID</td>" >> $OUTPUT_FILE
echo "<td>$NFD_VSIZE</td>" >> $OUTPUT_FILE
echo "<td>$NFD_LOGFILE_SIZE</td>" >> $OUTPUT_FILE
echo "<td>$NUM_NFD_STATUS_PROCS</td>" >> $OUTPUT_FILE
echo "<td>$ROOT_DISK_SIZE</td>" >> $OUTPUT_FILE
echo "<td>$ROOT_DISK_USED</td>" >> $OUTPUT_FILE
echo "<td>$ROOT_DISK_AVAIL</td>" >> $OUTPUT_FILE
echo "<td>$ROOT_DISK_AVAIL_PERCENT</td>" >> $OUTPUT_FILE
echo "<td>$BOOT_DISK_SIZE</td>" >> $OUTPUT_FILE
echo "<td>$BOOT_DISK_USED</td>" >> $OUTPUT_FILE
echo "<td>$BOOT_DISK_AVAIL</td>" >> $OUTPUT_FILE
echo "<td>$BOOT_DISK_AVAIL_PERCENT</td>" >> $OUTPUT_FILE
echo "</tr>" >> $OUTPUT_FILE
