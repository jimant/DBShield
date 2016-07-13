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
gcc -g -O0 -std=gnu99 -I/usr/include/mysql -L/usr/lib64/mysql -L/usr/lib64/jimant -L/usr/local/lib main.c -o approach -Wl,-rpath=/usr/local/lib -lgcrypt -ljimant_cryption -lmysqlclient
