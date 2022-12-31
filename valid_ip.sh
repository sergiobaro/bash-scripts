#!/bin/bash

function valid_ip () {
    if [[ "$1" =~ ^[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}$ ]]; then
        numbers=$(echo $1 | tr "." "\n")
        for number in $numbers; do
            if (( "$number" > 255 )); then
                echo "False"
                return 0
            fi
        done
        echo "True"
    else 
        echo "False"
    fi
}

function test_valid_ip () {
    ip=$1
    expected=$2

    result=$(valid_ip "$ip")

    NC='\033[0m'
    RED='\033[0;31m'
    GREEN='\033[0;32m'

    if [ "$expected" = "$result" ]; then
        echo -e "$ip -> ${GREEN}OK${NC}"
    else 
        echo -e "$ip -> ${RED}KO${NC}"
    fi
}

for arg; do
    valid_ip $arg
done

test_valid_ip "1.2.3.4" "True"
test_valid_ip "123.45.67.89" "True"
test_valid_ip "1.2.3" "False"
test_valid_ip "1.2.3.4.5" "False"
test_valid_ip "123.456.78.90" "False"
test_valid_ip "123.045.067.089" "False"
test_valid_ip "123.456.789.0" "False"
test_valid_ip "12.34.56" "False"
test_valid_ip "12.34.56 .1" "False"
test_valid_ip "12.34.56.-1" "False"
