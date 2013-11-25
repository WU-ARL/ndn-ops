#!/bin/bash
# Script for starting ospfd,zebra, ospfn and ndnd
# Author Hoque  - Nov/18/2011
# Updated by John DeHart Nov/2013

# /var/run is now linked to /run which is a tmpfs (in memory) filesystem
# that gets blown away on each reboot.
sudo mkdir -p /var/run/quagga-state
sudo chown quagga.quagga /var/run/quagga-state
sudo chmod g+w /var/run/quagga-state

# Starting zebra
echo "Starting Zebra.....";
sudo zebra -d 
sleep 2
echo "Done";


# starting ospfd
echo "starting ospfd.....";
sudo ospfd -d -a
sleep 10 
echo "Done";


# Initialize ndnd environment variables if rc file exists
test -f /usr/local/etc/ndnx/ndndrc && . /usr/local/etc/ndnx/ndndrc


#Starting ndnd
echo "Starting ndnd.....";
sudo -E ndndstart
sleep 2
echo "Done";

# Run ndndc if a static config file is present.
test -f /usr/local/etc/ndnx/ndnd.conf && ndndc -f /usr/local/etc/ndnx/ndnd.conf



#Starting ospfn
#echo " Give ospfn.conf file path with name";
#read ospfnconf
echo "starting ospfn.....";
ospfnconf=/usr/local/etc/quagga/ospfn.conf
sudo ospfn -d -f $ospfnconf
echo "Done";



