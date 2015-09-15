#!/usr/bin/python

import sys
import os
import subprocess

usage = "Usage: %s \n" % sys.argv[0]

neighborFaces = []
blacklist = []

def main(arv=None):
  #print 'main:'
  getBlacklist()
  getNeighborFaces()
  compare()

def compare():
  nLength = len(neighborFaces)
  bLength = len(blacklist)
  print nLength, "neighbor Faces and ", bLength, "blacklist addresses"
  for n in range(0, nLength):
    found = False
    for b in range (0, bLength):
      if (neighborFaces[n] == blacklist[b]):
        found = True
        b = bLength
      else:
        b += 1
    if ( not found ):
      print "neighbor face ", neighborFaces[n], " not found in blacklist"
    n += 1
  for b in range (0, bLength):
    found = False
    for n in range(0, nLength):
      if (neighborFaces[n] == blacklist[b]):
        found = True
        n = nLength
      else:
        n += 1
    if ( not found ):
      print "blacklist address ", blacklist[b], " not found in neighbor faces"
    b += 1


def getNeighborFaces():
  #print "getNeighborFaces:"
  output = subprocess.check_output("nfd-status -f | grep :6363 | grep persistent ", shell=True)
  #print "nfd-status -f: ", output
  lines = output.split('\n')
  count = len(lines)
  i = 0
  n = 0
  while ( i != count-1 ):
    #print "line[", i, "]: ", lines[i]
    words = lines[i].split('/')
    subwords = words[2].split(':')
    #print "subwords[0]: ", subwords[0]
    neighborFaces.append(subwords[0])
    n += 1
    #print "words[", 2, "]: ", words[2]
    #print "words[", 3, "]: ", words[3]
    #print "words[", 4, "]: ", words[4]
    i += 1
  i = 0
  while ( i != n ):
    print "neighborFaces[", i, "]: ", neighborFaces[i]
    i += 1

def getBlacklist():
  #print 'getBlacklist:'
  output = subprocess.check_output("ps auxwww | grep nfd-autoreg | grep -v grep ", shell=True)
  #print "nfd-autoreg: ", output
  words = output.split()
  count = len(words)
  i = 0
  b = 0
  while (i != count ):
    #print "words[",i, "]: ", words[i] 
    if ( words[i] == "-b" ) :
      #print "found a blacklisted face: ", words[i+1]
      subwords = words[i+1].split('/')
      blacklist.append(subwords[0])
      b += 1
    i += 1

  i = 0
  while ( i != b ):
    print "blacklist[", i, "]: ", blacklist[i]
    i += 1


if __name__ == '__main__':
    status = main()
    sys.exit(status)
