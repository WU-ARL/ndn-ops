#!/bin/bash

ARIZONA="udp://hobo.cs.arizona.edu"
BUPT="udp://114.247.165.44"
CAIDA="udp://click.caida.org"
CSU="udp://ndn.netsec.colostate.edu"
LIP6="udp://ndnhub.ipv6.lip6.fr"
MEMPHIS="udp://titan.cs.memphis.edu"
MICHIGAN="udp://ndn0.eecs.umich.edu"
NEU="udp://129.10.52.193"
ORANGE1="udp://161.105.195.18"
PKU="udp://162.105.146.26"
REMAP="udp://aleph.ndn.ucla.edu"
TONGJI="udp://cnlab.tongji.edu.cn"
UCI="udp://ndnhub.ics.uci.edu"
UCLA="udp://spurs.cs.ucla.edu"
UIUC="udp://ndnx.cs.illinois.edu"
WU="udp://wundngw.arl.wustl.edu"

nfdc register ndn:/ndn/cn/edu/bupt/ndnrtc $BUPT
nfdc register ndn:/ndn/cn/edu/pku/ndnrtc $PKU
#nfdc register ndn:/ndn/cn/edu/tongji/ndnrtc 
nfdc register ndn:/ndn/edu/arizona/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/colostate/ndnrtc $PKU
nfdc register ndn:/ndn/edu/memphis/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/neu/ndnrtc $PKU
nfdc register ndn:/ndn/edu/uci/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/ucla/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/ucla/remap/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/uiuc/ndnrtc $CAIDA
nfdc register ndn:/ndn/edu/umich/ndnrtc $PKU
nfdc register ndn:/ndn/edu/wustl/ndnrtc $CAIDA
nfdc register ndn:/ndn/fr/lip6/ndnrtc $CAIDA
nfdc register ndn:/ndn/fr/orange1/ndnrtc $CAIDA
nfdc register ndn:/ndn/org/caida/ndnrtc $CAIDA
