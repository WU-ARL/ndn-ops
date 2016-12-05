#!/bin/bash


sudo apt-get update

# needed for pyndn installs
aptitude install python3-dev python3-setuptools
easy_install3 pip
pip3 install requests

#sudo apt-get -y install build-essential ant git openjdk-6-jdk openjdk-6-jre openssl python-openssl libssl-dev expat libexpat-dev libpcap-dev
sudo apt-get -y install build-essential git openssl python-openssl libssl-dev expat libexpat-dev libpcap-dev
sudo apt-get -y install gawk texinfo asciidoc finger

sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common 

sudo apt-get -y install ntp

#sudo apt-get -y install python-pip python-apscheduler
#sudo pip install requests
##sudo pip install requests --upgrade

sudo apt-get -y install autoconf libtool

sudo apt-get -y install python-dev

sudo apt-get -y install g++ autotools-dev libicu-dev libbz2-dev  sqlite3


sudo apt-get -y install pkg-config
sudo apt-get -y install libssl-dev libsqlite3-dev libcrypto++-dev
#sudo apt-get -y install libboost1.48-all-dev 

