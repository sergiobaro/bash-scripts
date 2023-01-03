#!/usr/bin/env bash

var=$(cat <<'END_HEREDOC'
line1
line2
line3
END_HEREDOC
)

grep "line2" "$var" # doesn't work, grep doesn't support strings as arguments

echo ''
echo "$var" | grep "line2" # the usual way to get around it

echo ''
grep "line2" <<< "$var" # using a here string