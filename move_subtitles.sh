#!/bin/sh

REGEX="Subs/(.+)_s([0-9][0-9])e([0-9][0-9])/3_English.srt"

for file in Subs/*/*.srt
do
    if [[ $file =~ $REGEX ]]
    then
        name=${BASH_REMATCH[1]}
        season=${BASH_REMATCH[2]}
        episode=${BASH_REMATCH[3]}
        new_file="${name}_s${season}e${episode}.srt"
        echo "$file => $new_file"
        cp $file $new_file
    fi
done