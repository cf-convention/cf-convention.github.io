#!/usr/bin/env python

import sys, re

HELP = """%s - Retrieves title string. \nUsage:  %s <file>"""%(sys.argv[0], sys.argv[0])

if len(sys.argv) < 2:
    print HELP
    sys.exit(1)

file = sys.argv[1]

# Read input.
i = open(file, 'r')
s = i.read()
i.close()

# Fetch title.
p = re.compile('<title>(.*?)</title>', re.DOTALL)
m = re.search(p, s)
title = m.group(1)

# Fetch version.
version = None
try:
    p = re.compile('<subtitle>Version (.*?),(.*?)</subtitle>', re.DOTALL)
    m = re.search(p, s)
    version = m.group(1)
except:
    try:
        p = re.compile('<version_number>(.*?)</version_number>', re.DOTALL)
        m = re.search(p, s)
        version = m.group(1)
    except:
        pass
        
# Print output.
print '--------------------------------------------'
print ' Title:    %s'%title
if version != None:
    print ' Version:  %s'%version
print '--------------------------------------------'
    






    
        


