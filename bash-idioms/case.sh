#!/bin/bash

while read var; do
    case "$var" in
        [Yy]?? | [Oo][Kk] ) echo "OK" ;;
        [Nn][Oo]* ) echo "KO" ;;
        * ) echo "again" ;;
    esac
done
