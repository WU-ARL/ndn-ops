#!/bin/bash


sudo apt-get update
sudo apt-get -y install build-essential ant git openjdk-6-jdk openjdk-6-jre openssl python-openssl libssl-dev expat libexpat-dev libpcap-dev
sudo apt-get -y install gawk texinfo asciidoc finger

sudo apt-get -y install python-software-properties

sudo apt-get -y install ntp

sudo apt-get -y install python-pip python-apscheduler
sudo pip install requests
sudo pip install requests --upgrade
