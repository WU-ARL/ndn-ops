#!/bin/bash

#Basel is having trouble with ntp syncing time.
# Until we figure it out, we will periodically
# reset the time forcefully.

sudo service ntp stop
sudo ntpdate 0.ubuntu.pool.ntp.org
sudo service ntp start

