#!/usr/bin/python

import sys

base_count = 100000
#base_count = 999999

for line in sys.stdin:
	ss = line.strip().split('\t')
	key = ss[0]
	val = ss[1]

	#new_key = base_count - int(key)
	new_key = base_count + int(key)

	red_idx = 1
	if new_key < 50:
		red_idx = 0
	print "%s\t%s\t%s" % (red_idx,new_key,val)

	
