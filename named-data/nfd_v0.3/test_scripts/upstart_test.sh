#!/bin/bash


initctl stop nfd
initctl stop nlsr
initctl stop ndn-tlv-ping
initctl stop ndn-autoconfig-server
cp /var/log/syslog /tmp/syslog.pre
PRE_LOG_PRIORITY=`initctl log-priority`
echo "saved old priority: $PRE_LOG_PRIORITY"
initctl log-priority debug
initctl start nfd
sleep 20
initctl log-priority $PRE_LOG_PRIORITY
cp /var/log/syslog /tmp/syslog.post
diff /tmp/syslog.pre /tmp/syslog.post > /tmp/syslog.diff
