#!/usr/bin/env bash

filename=${1:-words.txt}

(( $# == 2 )) || { echo "Usage: $0 file1 file2"; exit 1; }

echo "$filename"