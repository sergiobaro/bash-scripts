#!/usr/bin/env bash

# Create nodes file
NODES_FILE='./nodes.txt'
> $NODES_FILE # create empty file
for n in node{0..9};
    do echo "$n" >> $NODES_FILE;
done

# Reads the whole file
mapfile -t hosts < $NODES_FILE
echo "${hosts[@]}"

# Reads the file in chunks
BATCH=3
while mapfile -t -n $BATCH hosts && ((${#hosts[@]})); do
    echo "${#hosts[@]}: ${hosts[@]}"
done < $NODES_FILE