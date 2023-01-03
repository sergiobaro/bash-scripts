#!/bin/bash

declare -a name_list

while read name; do
    name_list+=("$name")
done

for name in "${name_list[@]}"; do
    separator=${LIST:+,}
    LIST="${LIST}${separator}${name}"
done

