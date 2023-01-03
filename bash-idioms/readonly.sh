#!/bin/bash

readonly a=1
a=2

b=2
readonly b
b=3

echo "b: $b"

function f {
    local a
    a=47
    echo "local a: $a"
}

f
echo "a: $a"