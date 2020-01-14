#!/bin/bash

param="$1"


containsHttp() {
    [ ! -z $1 ] && [[ $1 = "https://"* ]] || [[ $1 = "http://"* ]]
}

test() {
    echo "------------------------"
    echo "Case: \"$1\""
    containsHttp $1
    result=$?
    if [ "$2" -eq "$result" ]; then
        echo "Success"
    else 
        echo "Failure"
    fi
    echo "Result $result - Expected: $2"
}

test "" 1
test "random" 1
test "https://" 0
test "http://" 0
test "http://www.google.com" 0
test "https://www.google.com" 0
