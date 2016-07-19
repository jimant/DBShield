#!/bin/bash

rm -rf fo4sLibs.o
gcc -DDEBUG_MODE -D_SVID_SOURCE -g -std=c99 -Wall -c fo4sLibs.c -o fo4sLibs.o
