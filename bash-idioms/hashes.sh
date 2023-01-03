#!/usr/bin/env bash

declare -A hash


hash=([a]=first [b]=second [c]=third [d]=forth)

hash[a]='foo'
hash[b]='bar'
hash[c]='baz'
hash[d]='three'
hash[e]='four'
hash[f]='five by five'
hash[g]='six'

echo -e "\nThe key count is ${#hash[@]} or ${#hash[*]}"
declare -p hash

echo ''
for key in ${!hash[@]}; do
    echo "$key in ${hash[$key]}"
done

unset -v 'hash[a]'
declare -p hash
