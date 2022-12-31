#!/usr/bin/env bash

## CREATE WORD FILE
WORD_FILE='words.txt'
> $WORD_FILE # create empty file

declare -A hash
list=(foo bar baz one two three four)

range="${#list[@]}"
for ((i=0; i<35; i++)); do
    random_element="$(( $RANDOM % $range ))"
    echo "${list[$random_element]}" >> $WORD_FILE
done

## READ WORD FILE
while read line; do
    (( hash[$line]++ ))
done < $WORD_FILE

for key in "${!hash[@]}"; do
    echo "$key: ${hash[$key]}"
done | sort -k2,2n

echo ''
cat $WORD_FILE | sort | uniq -c | sort -nr