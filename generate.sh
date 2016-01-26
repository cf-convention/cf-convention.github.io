#!/bin/bash

# Should we build cf-conventions-1.6 too?
cd Data/cf-conventions/cf-conventions-1.7
mkdir docbooktmp
make
git commit build -m "Auto-generated HTML"
