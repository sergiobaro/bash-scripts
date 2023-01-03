#!/bin/bash

var="global"

function f1 {
    local var="local"
    f2
}

function f2 {
    echo "$var"
}

echo "f2: $(f2)"
echo "f1: $(f1)"