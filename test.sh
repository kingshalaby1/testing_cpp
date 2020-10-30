#!/bin/bash
set -e
mkdir -p temp
file_name=$1
g++ "${file_name}".cpp -o "temp/${file_name}"
echo -e 'successfully compiled \n evaluating...'

## testing logic goes here

exit 0