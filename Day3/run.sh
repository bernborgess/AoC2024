#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
DEFAULT="\033[0;0m"

ghc mul.hs -o mul.out
actual=$(./mul.out < sample.txt)
expected="161"

if [[ "$actual" == "$expected" ]]; then
    echo -e "${GREEN}PASS${DEFAULT}"
else
    echo -e "${RED}FAIL${DEFAULT}"
    echo "Expected:"
    echo "$expected"
    echo "Got:"
    echo "$actual"
fi

