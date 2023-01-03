#!/bin/bash

intro=1
body=3
outro=2
max=$(( intro + body + outro - 1))

echo "$max"

x=$1

if (( max > x * 4 )); then
    echo "Yes"
else 
    echo "No"
fi
