#!/bin/bash

EASYASM="../../tools/EasyASM"
EXPECTED_OUTPUT="expected.txt"
OUTPUT_FILE=$(mktemp)
SRC_FILES="radix_sort.asm count_sort.asm"

$EASYASM --run easm_crt.asm main.asm $SRC_FILES > $OUTPUT_FILE
if [ $? -ne 0 ]; then
    exit 1
fi

diff $OUTPUT_FILE $EXPECTED_OUTPUT &> /dev/null
if [ $? -ne 0 ]; then
    printf "Test \x1b[31mFailed\x1b[0m\n"
else
    printf "Test \x1b[32mPassed\x1b[0m\n"
fi
