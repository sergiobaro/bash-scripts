#!/usr/bin/env bash

function cleanup {
    echo "$FUNCNAME"
}

echo "Starting script $0"

echo 'Setting the trap...'
trap "echo 'cleanup2'" ABRT EXIT HUP INT QUIT TERM
trap cleanup ABRT EXIT HUP INT QUIT TERM

echo 'About to exit...'