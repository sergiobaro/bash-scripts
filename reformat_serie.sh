#!/bin/bash
set -euo pipefail

# Arguments
if [ -z $1 ];
then 
    echo "Missing argument: serie name"
    exit 1
fi
serie_name=$1

# RENAME VIDEO FILES
VIDEO_REGEX=".+[sS]([0-9][0-9])[eE]([0-9][0-9]).+\.(.+)"
for file in *
do 
    if [[ $file =~ $VIDEO_REGEX ]]
    then
        season=${BASH_REMATCH[1]}
        episode=${BASH_REMATCH[2]}
        extension=${BASH_REMATCH[3]}
        
        video_file="${serie_name}_s${season}e${episode}.${extension}"
        echo "$file => $video_file"
        mv $file $video_file
    fi
done

# RENAME SUBTITLE FILES
SUB_REGEX="Subs/.+[sS]([0-9][0-9])[eE]([0-9][0-9]).*/.*English.srt"
for file in Subs/*/*.srt
do
    if [[ $file =~ $SUB_REGEX ]]
    then
        season=${BASH_REMATCH[1]}
        episode=${BASH_REMATCH[2]}
        new_file="${serie_name}_s${season}e${episode}.srt"
        echo "$file => $new_file"
        mv $file $new_file
    fi
done

# MERGE TO MKV

# Check if mkvmerge is installed
if ! command -v mkvmerge &> /dev/null 
then
    echo "mkvmerge not found"
    exit 1
fi

# Merge to mkv
MKV_REGEX="${serie_name}_s([0-9][0-9])e([0-9][0-9])\.(mp4)"
for file in *
do 
    if [[ $file =~ $MKV_REGEX ]]
    then
        season=${BASH_REMATCH[1]}
        episode=${BASH_REMATCH[2]}
        extension=${BASH_REMATCH[3]}
        filename="${serie_name}_s${season}e${episode}"
        mkv_command="-o $filename.mkv $filename.$extension $filename.srt"
        mkvmerge $mkv_command
    fi
done

# CLEAN UP
rm -rf Subs
rm *.mp4
rm *.srt