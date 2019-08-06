#!/usr/bin/python

import sys

base_count = 100000
#base_count = 999999

for line in sys.stdin:
    idx,key,val = line.strip().split('\t')
    print str(int(key) - base_count) + "\t" + val
    # print str(int(key)) - base_count + "\t" + val
