#!/bin/bash

function usage {
    echo "$0 [color|last|len|long]"
    exit
}

function ls_length {
    ls -1 "$@" | while read fn; do
        printf '%3d %s\n' ${#fn} ${fn}
    done | sort -n
}

(( $# < 1 )) && usage
sub=$1
shift

case $sub in 
    color)
        ls --color=tty "$@"
    ;;

    last | latest)
        ls -lrt | tail "-n${1:-5}"
    ;;

    len*)
        ls_length "$@"
    ;;

    long)
        ls_length "$@" | tail -1
    ;;

    *)
        echo "unknown command: $sub"
        usage
    ;;
esac