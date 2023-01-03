#!/usr/bin/env bash

# Create test file
IFS_TEST_FILE='./ifs-test.txt'
cat <<'EoF' > $IFS_TEST_FILE
line1 wd1 wd2 wd3
line2 wd1 wd2 wd3
line3 wd1 wd2 wd3
EoF

echo 'Normal $IFS and `read` operation; split into words:'
printf 'IFS before: %q\n' "$IFS"
while read line w1 w2 w3; do
    printf 'IFS during: %q\tline = %q, w1 = %q, w2 = %q, w3 = %q\n' \
        "$IFS" "$line" "$w1" "$w2" "$w3"
done < $IFS_TEST_FILE
printf 'IFS after: %q\n' "$IFS"

echo ''

echo 'Temporary $IFS change for `read` inline:'
echo 'Words are NOT split, yet $IFS appears unchanged, becuase only the read'
echo 'line has the changed $IFS.'
printf 'IFS before: %q\n' "$IFS"
while IFS='' read line w1 w2 w3; do
    printf 'IFS during: %q\tline = %q, w1 = %q, w2 = %q, w3 = %q\n' \
        "$IFS" "$line" "$w1" "$w2" "$w3"
done < $IFS_TEST_FILE
printf 'IFS after: %q\n' "$IFS"

function read_file {
    local file=$1
    local IFS=''

    while read line w1 w2 w3; do
        printf 'IFS during: %q\tline = %q, w1 = %q, w2 = %q, w3 = %q\n' \
            "$IFS" "$line" "$w1" "$w2" "$w3"
    done < $IFS_TEST_FILE
}

echo ''
echo 'Temporary $IFS changed for `read` in a function; NOT split, $IFS changed:'
printf 'IFS before: %q\n' "$IFS"
read_file
printf 'IFS after: %q\n' "$IFS"