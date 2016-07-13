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
rm -rf logManager.o
gcc -DDEBUG_MODE -c logManager.c -o logManager.o
