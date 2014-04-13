#!/bin/bash
# Script for starting ndnpingserver
# Authored by John DeHart Nov/2013

# We don't know what state PATH is in at this point in boot process.

export PATH="$PATH:/usr/local/sbin:/usr/local/bin"
# Start the ndnping server
echo "starting /usr/local/bin/ndnpingserver"
HOSTNAME=`hostname`
if [ $HOSTNAME = "wundngw" ]
then
  # WU
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/wustl >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "titan" ]
then
  # Memphis
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/memphis  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "mccoy" ]
then
  # CSU
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/colostate  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "ndn0" ]
then
  # Michigan
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/umich  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "spurs" ]
then
  # UCLA
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/ucla  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "ndn-remap-p05" ]
then
  # REMAP
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/ucla/remap  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "click" ]
then
  # UCSD/CAIDA
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/org/caida  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "pkuhub" ]
then
  # PKU
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/cn/edu/pku  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "hobo" ]
then
  # PKU
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/arizona  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "dyn-148-53" ]
then
  # NEU
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/neu  >& /var/log/ndnpingserver.log &'
fi

if [ $HOSTNAME = "ndnhub" ]
then
  # UCI
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/edu/uci  >& /var/log/ndnpingserver.log &'
fi
if [ $HOSTNAME = "ndnops" ]
then
  # TONGJI
  sudo bash -c '/usr/local/bin/ndnpingserver -d ndn:/ndn/cn/edu/tongji  >& /var/log/ndnpingserver.log &'
fi

