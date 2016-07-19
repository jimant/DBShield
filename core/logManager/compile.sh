#!/bin/bash

INCLUDE_PATH="./header"
SOURCE_PATH="./src"
COMPILE_MACRO="-DDEBUG"
rm -rf logManager.o
gcc -DDEBUG_MODE -c logManager.c -o logManager.o
