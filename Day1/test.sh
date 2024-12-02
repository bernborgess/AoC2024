#!/bin/bash
clear

# Haskell
#ghc one.hs -o one.out
#run=./one.out

# Lean
run="lean --run one.lean"

# Python
#run="python3 one.py"

# C
#gcc one.c -o one.out
#run=./one.out

test_cases=(
    "1 4\n2 5\n3 6"
    "3 4\n4 3\n2 5\n1 3\n3 9\n3 3\n"
)
expected=(
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

errors=0

for i in ${!test_cases[@]}; do
    test_case="${test_cases[$i]}"
    output=$(${run} < <(echo -e "$test_case"))
    if [[ $verbose == true ]]; then
        echo "Test $((i+1))"
        echo "Input:"
        echo -e "$test_case"
        echo "Output:"
        echo "$output"
    fi
    if [[ "$output" == "${expected[$i]}" ]]; then
        echo -e "${GREEN}PASS${DEFAULT} Test $((i+1))"
    else
        echo -e "${RED}FAIL${DEFAULT} $((i+1))"
        echo "Expected:"
        echo "${expected[$i]}"
        echo "Got:"
        echo "$output"
        errors=$errors+1
    fi
    echo "-----------------------"
done

if [[ $errors == 0 ]]; then
    real_output=$(${run} < input.txt)
    echo "Real Test"
    echo "Output:"
    echo "$real_output"
fi
