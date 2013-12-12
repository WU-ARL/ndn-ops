#!/bin/sh
# Script for starting ospfd,zebra, ospfn and ndnd
# Author Hoque  - Nov/18/2011

export LD_LIBRARY_PATH="/usr/local/lib"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"

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


##Starting ndnd
#echo "Starting ndnd.....";
#ndndstart
#sleep 2
#echo "Done";


#Starting ospfn
#echo " Give ospfn.conf file path with name";
#read ospfnconf
echo "starting ospfn.....";
sudo ospfn -d -f ~/ospfn.conf
echo "Done";



