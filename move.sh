#!/bin/sh

REGEX=".*s04e([0-9][0-9]).*3_English.srt"

for file in Subs/the*/*.srt; 
do
    if [[ $file =~ $REGEX ]]
    then
        episode=${BASH_REMATCH[1]}
        new_file="the_man_in_the_high_castle_s04e${episode}.srt"
        cp $file $new_file
    fi
done