#!/usr/bin/python

import sys

#ch2 = lambda x: '.'.join([str(x/(256**j*int(i)%256)]) for i in range(3,-1,-1)])
ip_convert = lambda x:sum([256**j*int(i) for j,i in enumerate(x.split('.')[::-1])])

def load_ip_lib_func(ip_lib_fd):
    ip_lib_list = []
    file_in = open(ip_lib_fd,'r')
    for line in file_in:
        ss = line.strip().split(' ')
        if len(ss) != 5:
            continue
        start_ip = ss[0].strip()
        end_ip = ss[1].strip()
        area = ss[2].strip()
        country = ss[3].strip()
        provice = ss[4].strip()

        ip_lib_list.append((ip_convert(start_ip),ip_convert(end_ip),area,country,provice))

    return ip_lib_list

def get_addr(ip_lib_list,ip_str):
    ip_num = ip_convert(ip_str)

    low = 0
    mid = 0
    high = len(ip_lib_list)-1

    while (low < high):
        mid = (low + high)/2
        sss = ip_lib_list[mid]
        start_ip = sss[0]
        end_ip = sss[1]
        provice = sss[4].strip()

        if ip_num < start_ip:
            high = mid - 1
        elif ip_num > start_ip:
            low = mid + 1

    if ip_num < start_ip:
        provice = ip_lib_list[mid - 1][4]
    else:
        provice = ip_lib_list[mid][4]
    return provice

def mapper_func(ip_lib_fd):
    ip_lib_list = load_ip_lib_func(ip_lib_fd)

    for line in sys.stdin:
        ss = line.strip().split()
        if len(ss) != 2:
            continue
        cookie = ss[0].strip()
        ip = ss[1].strip()

        user_addr = get_addr(ip_lib_list,ip)
        print "\t".join([cookie,ip,user_addr])


if __name__ == "__main__":
    module = sys.modules[__name__]
    func = getattr(module, sys.argv[1])
    args = None
    if len(sys.argv) > 1:
        args = sys.argv[2:]
    func(*args)

