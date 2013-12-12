#!/bin/sh
# Script for restarting zebra, ospfd, ndnd and ospfn
# Author Hoque - Nov/18/2011

sh stopAllFourDaemons.sh
sleep 2
sh startAllFourDaemons.sh
