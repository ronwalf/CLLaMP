# Generate help messages for the makefile
# NOTICE

# This software was produced for the U.S. Government
# under Contract No. FA8702-19-C-0001, and is
# subject to the Rights in Noncommercial Computer Software
# and Noncommercial Computer Software Documentation Clause DFARS 252.227-7014 (FEB 2014)

# Copyright 2024 The MITRE Corporation

import re

comments = []

for line in open('Makefile').readlines():
    if line.strip().startswith('#'):
        comments.append(line.strip()[1:])
    if re.match(r'^[^-\s]*:', line):
        target = line.split(':')[0].strip()
        print(target)
        print('\n'.join(comments))
        comments = []
        
