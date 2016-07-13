#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

rm -rf sharedMemory.o
gcc -D_SVID_SOURCE -std=c99 -Wall -g  -c sharedMemory.c -o sharedMemory.o
