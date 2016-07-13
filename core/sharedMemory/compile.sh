#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

rm -rf sharedMemory.o
gcc -D_SVID_SOURCE -g -std=c99 -Wall  -c sharedMemory.c -o sharedMemory.o
