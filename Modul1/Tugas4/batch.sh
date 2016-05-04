#!/usr/bin/env bash

gcc -O0 -c code0.c
gcc -O1 -c code01.c
gcc -O2 -c code02.c
gcc -O3 -c code03.c
gcc -Os -c code0s.c
gcc -Ofast -c code0fast.c
objdump -d code0.o > code0.s
objdump -d code01.o > code01.s
objdump -d code02.o > code02.s
objdump -d code03.o > code03.s
objdump -d code0s.o > code0s.s
objdump -d code0fast.o > code0fast.s
