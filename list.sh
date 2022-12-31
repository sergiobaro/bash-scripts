#!/bin/bash

declare -a name_list

while read name; do
    name_list+=("$name")
done

# list values
for person in "${name_list[@]}"; do
    echo "$person"
done

# using indexes
for i in "${!name_list[@]}"; do
    echo "$i => ${name_list[$i]}"
done

echo "${name_list[@]}"