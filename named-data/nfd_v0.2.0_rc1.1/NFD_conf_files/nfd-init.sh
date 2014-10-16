#!/bin/bash

# Some issues with startup time, we need to sleep to make sure nfd is fully up

sleep 15

# set default strategy to ncc
/usr/bin/nfdc set-strategy ndn:/ ndn:/localhost/nfd/strategy/ncc

# set broadcast strategy
/usr/bin/nfdc set-strategy /ndn/broadcast /localhost/nfd/strategy/broadcast



