#!/bin/bash

n=$1 
result=0
for ((i=1; i<="$n"; i++))
do
    result=$(($result + $i))
done

echo "$result"