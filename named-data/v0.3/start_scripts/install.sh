#!/bin/bash

# Install extra start scripts in /usr/local/bin

BINDIR=/usr/local/bin
sudo cp start_ndnping.sh   ${BINDIR}
sudo cp start_ndnmapXML.sh ${BINDIR}
