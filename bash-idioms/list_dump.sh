#!/bin/bash

# Different ways to display the values of a list
list=(foo bar baz three four "five by five" six)

echo -e "${list[@]}\n"

declare -p list

echo ''

echo -e "The element count is: ${#list[@]} or ${#list[*]}"
echo -e "The length of element [4] is: ${#list[4]}"

echo -ne "\n\${list[@]} = " ; printf "%q|" ${list[@]}
echo -ne "\n\${list[*]} = " ; printf "%q|" ${list[*]}
echo -ne "\n\"\${list[@]}\" = " ; printf "%q|" "${list[@]}"
echo -ne "\n\"\${list[*]}\" = " ; printf "%q|" "${list[*]}"

echo ''

function join {
    local IFS="$1"
    shift
    echo "$*"
}

echo ''
echo -en "join ',' \${list[@]} = " ; join ',' ${list[@]}
echo -en "join ',' \"\${list[@]}\" = " ; join ',' "${list[@]}"

echo ''

function string_join {
    local delimiter="$1"
    local first_element="$2"
    shift 2

    printf '%s' "$first_element" "${@/#/$delimiter}"
}

echo -n "string_join '<>' \${list[@]} = " ; string_join '<>' ${list[@]}
echo ''
echo -n "string_join '<>' \"\${list[@]}\" = " ; string_join '<>' "${list[@]}"
echo ''

echo -e "\nforeach \"\${!list[@]}\":"
for element in "${!list[@]}"; do # iterate over indexes
    echo -e "\telement: $element; value: ${list[$element]}"
done
echo ''

echo -e "\nforeach \${!list[*]}:"
for element in ${!list[*]}; do 
    echo -e "\telement: $element; value: ${list[$element]}"
done
echo ''