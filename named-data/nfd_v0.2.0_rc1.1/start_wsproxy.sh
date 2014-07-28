#!/bin/bash

# start ws_proxy
sudo rm -f /tmp/ws_proxy.log
/usr/local/bin/ws_proxy >& /tmp/ws_proxy.log &


