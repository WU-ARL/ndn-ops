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
# ndndstart will probably do this also
test -f /usr/local/etc/ndnx/ndndrc && . /usr/local/etc/ndnx/ndndrc


#Starting ndnd
echo "Starting ndnd.....";
sudo -E ndndstart 
sleep 2
echo "Done";

# Run ndndc if a static config file is present.
test -f /usr/local/etc/ndnx/ndnd.conf && sudo ndndc -f /usr/local/etc/ndnx/ndnd.conf


#Starting ospfn
#echo " Give ospfn.conf file path with name";
#read ospfnconf
echo "starting ospfn.....";
ospfnconf=/usr/local/etc/quagga/ospfn.conf
sudo ospfn -d -f $ospfnconf 
echo "Done";


# Start the ndnmap XML data collection
echo "starting /usr/local/bin/ndnxmlstat_c"
HOSTNAME=`hostname`
if [ $HOSTNAME = "wundngw" ]
then
  # WU
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 128.252.153.194 >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "titan" ]
then
  # Memphis
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 141.225.11.173  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "mccoy" ]
then
  # CSU
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 129.82.138.48  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "ndn0" ]
then
  # Michigan
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 141.212.108.18  >& /var/log/ndnxmlstat_c.log &'
fi
if [ $HOSTNAME = "spurs" ]
then
  # UCLA
  sudo bash -c '/usr/local/bin/ndnxmlstat_c -i 131.179.196.46  >& /var/log/ndnxmlstat_c.log &'
fi
