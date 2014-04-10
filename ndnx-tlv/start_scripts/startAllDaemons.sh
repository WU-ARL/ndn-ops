#!/bin/bash
# Script for starting ospfd,zebra, ospfn and ndnd
# Author Hoque  - Nov/18/2011
# Updated by John DeHart Nov/2013


# We don't know what state PATH is in at this point in boot process.

export PATH="$PATH:/usr/local/sbin:/usr/local/bin"
# for the purposes of starting the router daemons point home to where
# the config files are stored. This will make ndndstart work from those files
export HOME=/usr/local/etc

# make sure /usr/local/etc/.ndnx exists
if [ ! -f /usr/local/etc/.ndnx ]
then
  if [ ! -L /usr/local/etc/.ndnx ]
  then
     sudo ln -s /usr/local/etc/ndnx /usr/local/etc/.ndnx
  fi
fi

# make sure /var/log/ndnx exists
sudo mkdir -p /var/log/ndnx


# /var/run is now linked to /run which is a tmpfs (in memory) filesystem
# that gets blown away on each reboot.
sudo mkdir -p /var/run/quagga-state
sudo chown quagga.quagga /var/run/quagga-state
sudo chmod g+w /var/run/quagga-state

# Starting zebra
echo "Starting Zebra.....";
sudo zebra -d  -f /usr/local/etc/quagga/zebra.conf
sleep 2
echo "Done";



# starting ospfd
echo "starting ospfd.....";
sudo ospfd -d -a -f /usr/local/etc/quagga/ospfd.conf
sleep 10 
echo "Done";


# Initialize ndnd environment variables if rc file exists
# ndndstart will probably do this also
test -f /usr/local/etc/ndnx/ndndrc && . /usr/local/etc/ndnx/ndndrc


#Starting ndnd
echo "Starting ndnd.....";
sudo -E ndnd-tlv-start 
sleep 2
echo "Done";

sleep 10

# Run ndnd2c if a static config file is present.
test -f /usr/local/etc/ndnx/ndnd.conf && sudo ndnd2c -f /usr/local/etc/ndnx/ndnd.conf


#Starting ospfn
#echo " Give ospfn.conf file path with name";
#read ospfnconf
echo "starting ospfn.....";
ospfnconf=/usr/local/etc/quagga/ospfn.conf
sudo ospfn -d -f $ospfnconf 
echo "Done";


# Start the ndnmap XML data collection
/usr/local/bin/start_ndnmapXML.sh

# Start the ndnping server
/usr/local/bin/start_ndnping.sh

