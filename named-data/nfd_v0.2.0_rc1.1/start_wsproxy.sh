#!/bin/bash

# start ws_proxy
sudo rm /tmp/ws_proxy.log
/usr/local/bin/ws_proxy >& /tmp/ws_proxy.log &


