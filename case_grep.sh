#!/bin/bash

SELF=$0
action=$1
shift

case "$action" in 

    h1 )            # Inside chapter heading 1
        echo "Heading 1"
    ;;
    h2 )            # Inside chapter heading 2
        echo "Heading 2"
    ;;
    h3 )            # Inside chapter heading 3
        echo "Heading 3"
    ;;

    id )            ## Convert to ID
        echo "Identifier"
    ;;

    index )         ## Creates index
        echo "Index"
    ;;

    rerun )         ## Run examples
        echo "Rerun"
    ;;

    cleanup )       ## Clean up all 
        echo "Clean up"
    ;;

    * )
        ( echo "Usage:"
        egrep '\)[[:space:]]+# ' $0
        egrep '\)[[:space:]]+## ' $0
        ) | grep "${1:-.}"
esac