#!/bin/bash
clear

ghc one.hs -o one.out

test_cases=(
    "1 2 3\n1 2 3"
    "1 2 3\n4 5 6"
    "3 4 2 1 3 3\n4 3 5 3 9 3"
)
expected=(
    "0"
    "9"
    "11"
)

GREEN="\033[0;32m"
RED="\033[0;31m"
DEFAULT="\033[0;0m"

verbose=false
if [[ "$1" == "-v" ]]; then
    verbose=true
fi

for i in ${!test_cases[@]}; do
    test_case="${test_cases[$i]}"
    output=$(./one.out < <(echo -e "$test_case"))
    if [[ $verbose == true ]]; then
        echo "Test $((i+1))"
        echo "Input:"
        echo -e "$test_case"
        echo "Output:"
        echo "$output"
        echo "-----------------------"
    fi
    if [[ "$output" == "${expected[$i]}" ]]; then
        echo -e "${GREEN}PASS${DEFAULT} Test $((i+1))"
    else
        echo -e "${RED}FAIL${DEFAULT} $((i+1))"
        echo "Expected:"
        echo "${expected[$i]}"
        echo "Got:"
        echo "$output"
    fi
done
