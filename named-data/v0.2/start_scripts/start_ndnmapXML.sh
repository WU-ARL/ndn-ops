#!/bin/bash
# Script for starting ndnxmlstat_c
# Authored by John DeHart Nov/2013

# We don't know what state PATH is in at this point in boot process.

export PATH="$PATH:/usr/local/sbin:/usr/local/bin"
# Start the ndnmap XML data collection
echo "starting /usr/local/bin/ndnxmlstat_c"
HOSTNAME=`hostname`
if [ $HOSTNAME = "wundngw" ]
then
  # WU
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 128.252.153.194 >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "titan" ]
then
  # Memphis
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 141.225.11.173  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "mccoy" ]
then
  # CSU
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 129.82.138.48  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "ndn0" ]
then
  # Michigan
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 141.212.108.18  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "spurs" ]
then
  # UCLA
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 131.179.196.46  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "ndn-remap-p05" ]
then
  # REMAP
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 164.67.204.133  >& /var/log/ndnxmlstat_c.log &'
fi

