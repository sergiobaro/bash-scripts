#!/bin/bash

list=(foo bar baz three four "five by five" six)
declare -p list

# print from element 5 a slice of 2 elements
printf "%q|" "${list[@]:5:2}"
echo ''

# Remove first element
echo ''
list=("${list[@]:1}")
declare -p list

# Remove last element
echo ''
unset -v "list[${#list[*]} -1]"
declare -p list

# Remove an element
unset -v 'list[2]'
declare -p list

# Delete the whole list
unset -v 'list'
declare -p list