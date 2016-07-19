#!/bin/bash

rm -rf fo4sLibs.o
gcc -D_SVID_SOURCE -std=c99 -Wall -c fo4sLibs.c -o fo4sLibs.o
