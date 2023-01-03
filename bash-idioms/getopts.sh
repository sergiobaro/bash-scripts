#!/usr/bin/env bash

VERBOSE=0
OFILE=''

echo "args before: ${@}"

while getopts ':v-:o:' VAL ; do
    case $VAL in
        v ) VERBOSE=1 ;; # -v
        o ) OFILE="$OPTARG" ;; # -o file
        - ) # long options
            case $OPTARG in 
                verbose ) VERBOSE=1 ;; # --verbose
                outfile=* ) OFILE="${OPTARG#outfile=}" ;; # --outfile=file
                outfile ) # --outfile file
                    OFILE="${!OPTIND}" # retrieve optional argument
                    let OPTIND++ # point to the next option
                ;;
                * ) echo "error: unknown long option: $OPTARG"
            esac
            ;;
        : ) echo "error: no arg supplied to $OPTARG option" ;;
        ? ) echo "error: unknown option $OPTARG" ;;
    esac
done
shift $((OPTIND -1)) # Remove parsed options from string arguments list

echo "verbose: $VERBOSE"
echo "outfile: $OFILE"
echo "args after: ${@}"