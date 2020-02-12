#!/bin/bash

cd Data/cf-conventions/cf-conventions-1.8
mkdir docbooktmp
make
git commit build -m "Auto-generated HTML"
