#!/bin/bash
# Script for stoping ndnpingserver
# Authored by John DeHart Nov/2013

# We don't know what state PATH is in at this point in boot process.

export PATH="$PATH:/usr/local/sbin:/usr/local/bin"
# Start the ndnping server
echo "stoping /usr/local/bin/ndnpingserver"

sudo killall ndnpingserver
