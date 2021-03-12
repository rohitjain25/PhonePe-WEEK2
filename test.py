import re
from collections import Counter



def reader(f):
    f = open("/Users/rohitj.intern/Desktop/task2.log")
    log = f.read()
    regexp =  r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
    ips_list = re.findall(regexp, log)
    print(ips_list)

def count(ips_list): 
    return Counter(ips_list)

f = open("/Users/rohitj.intern/Desktop/task2.log")
#reader(f)
count(f)

if __name__ == '__main__':
    reader('log')