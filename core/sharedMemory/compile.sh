#!/bin/bash

rm -rf sharedMemory.o
gcc -D_SVID_SOURCE -g -std=c99 -Wall  -c sharedMemory.c -o sharedMemory.o
