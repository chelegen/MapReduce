#!/usr/bin/python

import sys

tmp1 = ""

for line in sys.stdin:
    key,flag,val = line.strip().split('\t')

    if flag == '1':
        tmp1 = val
    elif flag == '2' and tmp1 != "":
        tmp2 = val
        print "%s\t%s\t%s" % (key,tmp1,tmp2)
        tmp1 = ""