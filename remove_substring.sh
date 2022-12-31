#!/bin/bash

url='https://www.google.com/keep/score'

echo $url
echo "Remove shortest part from the beginning: ${url#*/}"
echo "Remove longest part from the beginning: ${url##*/}"
echo "Remove shortest part from the end: ${url%/*}"
echo "Remove longest part from the end: ${url%%/*}"