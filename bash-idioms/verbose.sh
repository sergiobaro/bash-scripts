#!/usr/bin/env bash

VERBOSE=':'

while getopts ':v-:' OPTION; do
    case $OPTION in
        v ) VERBOSE='echo' ;;
        - ) case $OPTARG in 
                verbose ) VERBOSE='echo' ;;
                * ) echo "Unknown option $OPTARG" ;;
            esac
            ;;
        * ) echo "Unknown option $OPTARG" ;;
    esac
done

$VERBOSE "Verbose"