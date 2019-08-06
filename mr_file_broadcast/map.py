#!/usr/bin/python

import sys

def read_local_file_func(f):
    word_set = set()
    file_in = open(f,'r')
    for line in file_in:
        word = line.strip()
        word_set.add(word)
    return word_set

def mapper_func(white_list):
    word_set = read_local_file_func(white_list)

    for line in sys.stdin:
        ss = line.strip().split(' ')
        for s in ss:
            word = s.strip()
            if word and (word in word_set):
                print "\t".join([word,'1'])

if __name__ == '__main__':
    moudle = sys.modules[__name__]
    func = getattr(moudle,sys.argv[1])
    args = None
    if len(sys.argv) > 1:
        args = sys.argv[2:]
    func(*args)