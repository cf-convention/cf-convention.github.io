#!/usr/bin/env python

import sys, re

HELP = """%s - Removes second title. \nUsage:  %s <file>"""%(sys.argv[0], sys.argv[0])

if len(sys.argv) < 2:
    print HELP
    sys.exit(1)

file = sys.argv[1]

# Read input.
i = open(file, 'r')
s = i.read()
i.close()
    
# Remove the tag.
p = re.compile('<h2 class="title"(.*?)</h2>', re.DOTALL)
fix = re.sub(p, '', s, 1)

# Write output.
o = open(file, 'w')
o.write(fix)
o.close()

print '%s - removed second title.'%file



