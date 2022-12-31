#!/usr/bin/env bash

VERBOSE=0
OFILE=''

echo "args before: ${@}"

while getopts ':v-:o:' VAL ; do
    case $VAL in
        v | verbose ) VERBOSE=1 ;;
        o | outfile ) OFILE="$OPTARG" ;;
        - ) # long options
            case $OPTARG in 
                verbose ) VERBOSE=1 ;;
                outfile=* ) OFILE="${OPTARG#outfile=}" ;;
                outfile ) OFILE="${!OPTIND}"; let OPTIND++ ;;
                * ) echo "error: unknown long option: $OPTARG"
            esac
            ;;
        : ) echo "error: no arg supplied to $OPTARG option" ;;
        ? ) echo "error: unknown option $OPTARG" ;;
    esac
done
shift $((OPTIND -1))

echo "verbose: $VERBOSE"
echo "outfile: $OFILE"
echo "args after: ${@}"