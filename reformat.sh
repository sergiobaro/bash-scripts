#!/bin/sh

REGEX=".*s04e([0-9][0-9]).*"

for file in *.mp4;
do 
    if [[ $file =~ $REGEX ]]
    then
        episode=${BASH_REMATCH[1]}
        name="the_man_in_the_high_castle_s04e${episode}"
        command="-o $name.mkv $name.mp4 $name.srt"
        mkvmerge $command
    fi
done