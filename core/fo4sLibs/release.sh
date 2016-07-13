/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#!/bin/bash

rm -rf fo4sLibs.o
gcc -D_SVID_SOURCE -std=c99 -Wall -c fo4sLibs.c -o fo4sLibs.o
