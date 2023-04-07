#!/usr/bin/env bash
set -euo pipefail

# INITIAL CHECKS

# Check if bash version is >= 4
bash_major_version=${BASH_VERSINFO[0]}
if (( $bash_major_version < 4 )); then
  echo "Minimum bash version required 4, current version: ${BASH_VERSION}"
  exit 1
fi

# Check if mkvmerge is installed
if ! command -v mkvmerge &> /dev/null; then
    echo 'mkvmerge not installed'
    exit 1
fi

# SUBTITLES

declare -A subtitles # [season+episode] => subtitle file
readonly SUB_FILE_REGEX="Subs/.+[sS]([0-9][0-9])[eE]([0-9][0-9]).*/.*English.srt"
for sub_folder in Subs/*/; do
  # Find largest subtitle file
  largest_subtitle_file=""
  largest_subtitle_size=0
  for sub_file in $sub_folder*; do
    if [[ $sub_file =~ $SUB_FILE_REGEX ]]; then
      sub_size=$(stat -f%z "$sub_file")
      if (( $sub_size > $largest_subtitle_size )); then
        largest_subtitle_file=$sub_file
        largest_subtitle_size=$sub_size
      fi
    fi
  done

  if [[ $largest_subtitle_file =~ $SUB_FILE_REGEX ]]; then
    season=${BASH_REMATCH[1]}
    episode=${BASH_REMATCH[2]}
    key="${season}${episode}"
    subtitles[$key]=$largest_subtitle_file
  fi
done

# VIDEO FILES

# serie title from video file name
function title {
  local name=$1
  name=${name,,} # lowercase all characters
  name=${name%.} # remove last '.'
  name=${name//./_} # replace all '.' with '_'
  echo "$name"
}

readonly VIDEO_FILE_REGEX="(.+)[sS]([0-9][0-9])[eE]([0-9][0-9]).+\.(.+)"
readonly SUB_REGEX=".+([0-9])_([a-zA-Z]+)\.srt"
for file in *; do
  if [[ $file =~ $VIDEO_FILE_REGEX ]]; then
    name=$(title ${BASH_REMATCH[1]})
    season=${BASH_REMATCH[2]}
    episode=${BASH_REMATCH[3]}
    # extension=${BASH_REMATCH[4]}

    output_video_file="${name}_s${season}e${episode}.mkv"
    subtitle_key="${season}${episode}"
    subtitle_file=${subtitles[$subtitle_key]}
    if [[ $subtitle_file =~ $SUB_REGEX ]]; then
      sub_channel=${BASH_REMATCH[1]}
      sub_name=${BASH_REMATCH[2]}
      sub_lang=${sub_name,,} # lowercase
      sub_lang=${sub_lang:0:3} # first 3 characters
      mkv_args_sub="--language 0:$sub_lang --track-name 0:$sub_name $subtitle_file"
    fi

    mkv_args="-o $output_video_file $file $mkv_args_sub"

    mkvmerge $mkv_args
  fi
done

# CLEAN UP
rm -rf Subs
rm *.mp4
rm RARBG.txt
