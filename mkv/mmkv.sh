#!/usr/bin/env bash

usage () {
  echo 'mmkv -o output_file.mkv -s subtitle_file:language:track_name input_file'
}

while getopts 'o:s:l:' option ; do
  case $option in 
    o ) output_file="$OPTARG" ;;
    s ) subtitle="$OPTARG" ;;
  esac
done

shift $((OPTIND - 1)) # remove options from the arguments list
input_file="$1"

IFS=':' read subtitle_file subtitle_language subtitle_name <<< "$subtitle"
[[ -z "$subtitle_file" ]] && usage && exit 1
[[ -z "$subtitle_language" ]] && usage && exit 1
[[ -z "$subtitle_name" ]] && usage && exit 1

# echo "output_file: $output_file"
# echo "subtitle_file: $subtitle_file"
# echo "subtitle_language: $subtitle_language"
# echo "subtitle_name: $subtitle_name"
# echo "input_file: $input_file"

mkvmerge -o $output_file --language 0:$subtitle_language --track-name 0:$subtitle_name $subtitle_file $input_file

