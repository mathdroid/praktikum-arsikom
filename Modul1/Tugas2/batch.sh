#!/usr/bin/env bash

gcc -E code.c > code.i
gcc -S code.c
gcc -c code.c
gcc -o code code.c
./code
