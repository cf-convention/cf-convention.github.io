#!/usr/bin/env python

import os
import subprocess
import sys

if len(sys.argv) < 3:
    print 'Usage: encode.py <location> <file_extension>'
    sys.exit(1)
    
loc = sys.argv[1]
ext = sys.argv[2]


for file in os.listdir(loc):

    # Skip if suffix doesn't match given extension.
    suffix = file[len(file)-len(ext):]
    if suffix != ext:
        continue

    # Replace encoding string in <meta> tag.
    fullpath = os.path.join(loc,file)
    cmd = 'replace charset=ISO-8859-1 charset=utf-8 -- %s'%fullpath
    p = subprocess.Popen(cmd, shell=True)
    p.wait()

    # Convert encoding in a temporary file.
    tempname = '%s.utf-8'%fullpath
    cmd = 'iconv -f iso-8859-1 -t utf-8 %s > %s'%(fullpath,tempname)
    p = subprocess.Popen(cmd, shell=True)
    p.wait()

    # Replace temporary with original.
    cmd = 'mv %s %s'%(tempname,fullpath)
    p = subprocess.Popen(cmd, shell=True)
    p.wait()
    
        
