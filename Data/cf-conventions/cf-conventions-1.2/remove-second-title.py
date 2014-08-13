#!/usr/bin/env python

import os, sys, re
    
if len(sys.argv) < 3:
    print 'Usage: %s <location> <file_suffix>'%sys.argv[0]
    sys.exit(1)
    
loc = sys.argv[1]
suf = sys.argv[2]

for file in os.listdir(loc):

    # Skip if file doesn't have the given suffix.
    suffix = file[len(file)-len(suf):]
    if suffix != suf:
        continue

    file = os.path.join(loc, file)

    # Read input.
    i = open(file, 'r')
    s = i.read()
    i.close()
    
    # Remove the tag.
    p = re.compile('<h1 class="title"(.*?)</h1>', re.DOTALL)
    fix = re.sub(p, '', s, 1)
    if fix == s:
        p = re.compile('<h2 class="title"(.*?)</h2>', re.DOTALL)        
        fix = re.sub(p, '', s, 1)
    if fix != s:
        # Write output.
        o = open(file, 'w')
        o.write(fix)
        o.close()

        print '%s - removed second title.'%file
        


