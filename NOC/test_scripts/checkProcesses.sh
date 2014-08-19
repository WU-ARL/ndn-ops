#!/bin/bash


#ndnops@click:~$ ps -auxwww | grep nlsr
#Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
#nlsr     19175  1.4  1.8 101360 19036 ?        Ss   Aug17   7:24 /usr/bin/nlsr -f /etc/ndn/nlsr/nlsr.conf
#ndnops   20632  0.0  0.0   9392   900 pts/8    S+   07:40   0:00 grep --color=auto nlsr
#ndnops@click:~$ ps -auxwww | grep nfd
#Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
#root     19158  1.0 37.7 527728 383732 ?       Ssl  Aug17   5:12 /usr/bin/nfd --config /etc/ndn/nfd.conf
#root     19164  0.0  0.9 115064 10012 ?        Ss   Aug17   0:04 python2.7 /usr/bin/nfd-status-http-server -a 0.0.0.0 -p 80
#ndn      19169  0.0  0.8  71700  8440 ?        Ss   Aug17   0:07 /usr/bin/nfd-autoreg -b 131.179.196.46 -b 128.195.4.36 -b 128.196.203.36 -b 202.120.188.176 --prefix /ndn/org/caida --all-faces-prefix /ndn/broadcast
#ndn      19170  1.9  1.3  75332 14028 ?        S    Aug17   9:51 /usr/bin/nrd --config /etc/ndn/nfd.conf
#ndnops   20634  0.0  0.0   9392   900 pts/8    S+   07:40   0:00 grep --color=auto nfd


NLSR_PID=`ps auxwww | grep -v grep | grep "/usr/bin/nlsr" | sed -e 's/nlsr */nlsr /' | cut -d' ' -f 2`
NFD_PID=`ps auxwww | grep -v grep | grep -v autoreg | grep -v http | grep "/usr/bin/nfd" | sed -e 's/root */root /' | cut -d' ' -f 2`
NRD_PID=`ps auxwww | grep -v grep | grep "/usr/bin/nrd" | sed -e 's/ndn */ndn /' | cut -d' ' -f 2`
NFD_AUTOREG_PID=`ps auxwww | grep -v grep | grep "/usr/bin/nfd-autoreg" | sed -e 's/ndn */ndn /' | cut -d' ' -f 2`
NFD_STATUS_HTTP_SERVER_PID=`ps auxwww | grep -v grep | grep "/usr/bin/nfd-status-http-server" | sed -e 's/root */root /' | cut -d' ' -f 2`

echo "NLSR_PID=$NLSR_PID"
echo "NFD_PID=$NFD_PID"
echo "NRD_PID=$NRD_PID"
echo "NFD_AUTOREG_PID=$NFD_AUTOREG_PID"
echo "NFD_STATUS_HTTP_SERVER_PID=$NFD_STATUS_HTTP_SERVER_PID"

top -p $NFD_PID,$NRD_PID,$NLSR_PID,$NFD_AUTOREG_PID,$NFD_STATUS_HTTP_SERVER_PID
