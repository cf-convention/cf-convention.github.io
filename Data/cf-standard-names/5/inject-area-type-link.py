#!/usr/bin/env python

import sys, re

HELP = """%s - Injects link to area_type table. \nUsage:  %s <file>"""%(sys.argv[0], sys.argv[0])

if len(sys.argv) < 2:
    print HELP
    sys.exit(1)
    
file = sys.argv[1]

# Read input.
i = open(file, 'r')
s = i.read()
i.close()
    
# Replace text.
text = 'area_type table'
p = re.compile(text, re.DOTALL)
fix = re.sub(p, '<a href="http://cfconventions.org/Data/area-type-table/current/build/area-type-table.html">%s</a>'%text, s, 1)

# Write output.
o = open(file, 'w')
o.write(fix)
o.close()

print '%s - injected link'%file
    


