#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./run.sh <language> <problem_number>"
    exit 1
fi

LANG=$1
PROBLEM=$2

case $LANG in
    c|C)
        gcc -o temp.out C/${PROBLEM}.c && ./temp.out < test_cases/${PROBLEM}.txt
        ;;
    py|python|Python)
        python3 Python/${PROBLEM}.py < test_cases/${PROBLEM}.txt
        ;;
    asm|assembly|Assembly)
        nasm -f elf64 Assembly/${PROBLEM}.s && ld -o temp.out ${PROBLEM}.o && ./temp.out < test_cases/${PROBLEM}.txt
        ;;
    *)
        echo "Unsupported language: $LANG"
        ;;
esac

