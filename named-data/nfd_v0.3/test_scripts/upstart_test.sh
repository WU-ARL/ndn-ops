#!/bin/bash


echo "you may see some 'initctl: Unknown instace:' messages. That is ok"
initctl stop nfd
initctl stop nlsr
initctl stop ndn-tlv-ping
initctl stop nfd-autoreg
initctl stop nfdstat_c
initctl stop nfd-status-http-server
initctl stop repo-ng
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
