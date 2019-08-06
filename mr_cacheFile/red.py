#!/usr/bin/python
import sys


def reducer_func():
    tmp = None
    sum = 0
    count = []

    for line in sys.stdin:
        word, val = line.strip().split('\t')

        if tmp == None:
            tmp = word
        if tmp != word:
            for i in count:
                sum += i
            print "\t".join([tmp, str(sum)])
            tmp = word
            sum = 0
            count = []
        count.append(int(val))

    for i in count:
        sum += i
    print "%s\t%s" % (tmp, str(sum))


if __name__ == '__main__':
    module = sys.modules[__name__]
    func = getattr(module, sys.argv[1])
    args = None
    if len(sys.argv) > 1:
        args = sys.argv[2:]
        func(*args)
