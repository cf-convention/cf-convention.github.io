#!/usr/bin/env python

import sys, re

HELP = """%s - Injects link to area_type table. \nUsage:  %s <file>"""%(sys.argv[0], sys.argv[0])

if len(sys.argv) < 2:
    print(HELP)
    sys.exit(1)
    
file = sys.argv[1]

# Read input.
with open(file, 'r', encoding="utf8") as i:
    s = i.read()
    
# Replace text.
text = 'area_type table'
p = re.compile(text, re.DOTALL)
fix = re.sub(p, '<a href="http://cfconventions.org/Data/area-type-table/current/build/area-type-table.html">%s</a>'%text, s, 1)

# Write output.
with open(file, 'w', encoding="utf8", newline="\n") as o:
    o.write(fix)

print('%s - injected link'%file)
    


