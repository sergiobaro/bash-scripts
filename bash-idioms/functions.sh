#!/bin/bash

function f1 () {
    echo "${FUNCNAME[@]}"
    f2
}

function f2 {
    echo "${FUNCNAME[@]}"
    f3
}

f3 () {
    echo "${FUNCNAME[@]}"
}

var=$(f1)

echo "$var"
