#!/bin/sh

REGEX="(.+)_s([0-9][0-9])e([0-9][0-9]).*"

for file in *.mp4;
do 
    if [[ $file =~ $REGEX ]]
    then
        name=${BASH_REMATCH[1]}
        season=${BASH_REMATCH[2]}
        episode=${BASH_REMATCH[3]}
        filename="${name}_s${season}e${episode}"
        command="-o $filename.mkv $filename.mp4 $filename.srt"
        mkvmerge $command
    fi
done