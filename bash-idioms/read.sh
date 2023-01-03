#!/usr/bin/env bash

read -ei 'default value' -p 'Enter value: '
echo $REPLY

echo ''
read -sp 'Enter password: '
echo -e "\n$REPLY"

echo ''
read -n1 -p 'Press any key to continue...'
