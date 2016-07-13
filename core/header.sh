#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

JIMANT_WORK_ROOT_PATH=$(pwd)

FO4S_LIBS_DIR="$JIMANT_WORK_ROOT_PATH/fo4sLibs"
SHARED_MEMORY_DIR="$JIMANT_WORK_ROOT_PATH/sharedMemory"
LOG_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/logManager"
APPROACH_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/approachManager"
CRYPTION_DIR="$JIMANT_WORK_ROOT_PATH/cryption"
KEY_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/keyManager"

cp -uf common.h /usr/include/jimant
cp -uf $FO4S_LIBS_DIR/*.h /usr/include/jimant/fo4sLibs
cp -uf $SHARED_MEMORY_DIR/*.h /usr/include/jimant/sharedMemory
cp -uf $LOG_MANAGER_DIR/*.h /usr/include/jimant/logManager
cp -uf $CRYPTION_DIR/*.h /usr/include/jimant/cryption
cp -uf $KEY_MANAGER_DIR/*.h /usr/include/jimant/keyManager
