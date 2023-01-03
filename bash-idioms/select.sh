#!/usr/bin/env bash

PS3='NODE> '
select node in $(cat nodes.txt) Exit; do
    case $REPLY in 
        1|q|x|quit|exit ) exit 0 ;;
        * ) break ;;
    esac
done

echo "$node"