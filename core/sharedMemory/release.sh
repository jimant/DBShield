#!/bin/bash

rm -rf sharedMemory.o
gcc -D_SVID_SOURCE -std=c99 -Wall -g  -c sharedMemory.c -o sharedMemory.o
