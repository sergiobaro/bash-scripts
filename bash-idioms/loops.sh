#!/bin/bash

for i in {01..10}; do
    echo "$i"
done

echo
for ((i=0; i<10; i++))
do 
    echo "$i"
done

# for ((;;))
# do 
#     printf 'forever'
# done

echo
for arg; do
    echo "$arg"
done

echo
for file in $(ls); do
    echo "$file"
done
