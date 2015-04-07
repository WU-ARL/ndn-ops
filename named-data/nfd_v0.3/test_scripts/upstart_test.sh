#!/bin/bash


cp /var/log/syslog /tmp/syslog.pre
PRE_LOG_PRIORITY=`initctl log-priority`
initctl log-priority debug
initctl restart nfd
sleep 20
initctl log-priority $PRE_LOG_PRIORITY
cp /var/log/syslog /tmp/syslog.post
diff /tmp/syslog.pre /tmp/syslog.post > /tmp/syslog.diff
