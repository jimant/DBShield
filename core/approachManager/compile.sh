#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

INCLUDE_PATH="./header"
SOURCE_PATH="./src"
COMPILE_MACRO="-DDEBUG"
rm -rf approach
gcc -DDEBUG_MODE -g -O0 -std=gnu99 -I/usr/include/mysql -I/home/goodocy/project/Encryption_Server/fo4sLibs -L/usr/lib/mysql ../sharedMemory.c main.c -o approach -lmysqlclient
