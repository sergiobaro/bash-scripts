#!/usr/bin/env bash

for line in $(cat nodes.txt); do
    echo "$line"
done

for line in $(< nodes.txt); do
    echo "$line"
done