#!/bin/bash

file=$1

if [ -z "$file" ]
then
    echo "Nothing to find"
elif [ -f "$file" ]
then
    echo "Found $file"
else 
    echo "Can't find $file"
fi