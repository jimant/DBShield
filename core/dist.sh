#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
#

#!/bin/bash

echo "--------------- core start ---------------"

JIMANT_WORK_ROOT_PATH=$(pwd)

FO4S_LIBS_DIR="$JIMANT_WORK_ROOT_PATH/fo4sLibs"
SHARED_MEMORY_DIR="$JIMANT_WORK_ROOT_PATH/sharedMemory"
LOG_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/logManager"
APPROACH_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/approachManager"
CRYPTION_DIR="$JIMANT_WORK_ROOT_PATH/cryption"
KEY_MANAGER_DIR="$JIMANT_WORK_ROOT_PATH/keyManager"

export JIMANT_WORK_ROOT_PATH

OBJS_DIR="$JIMANT_WORK_ROOT_PATH/objs"
if [ ! -d $OBJS_DIR ]
	then
	mkdir $OBJS_DIR
fi

#LIBS_DIR="$JIMANT_WORK_ROOT_PATH/libs"
LIBS_DIR="/usr/lib64/jimant"
if [ ! -d $LIBS_DIR ]
	then
	mkdir $LIBS_DIR
fi

INCLUDE_DIR="/usr/include/jimant"
if [ ! -d $INCLUDE_DIR ]
	then
	mkdir $INCLUDE_DIR
fi

if [ ! -d "$INCLUDE_DIR/fo4sLibs" ]
	then
	mkdir "$INCLUDE_DIR/fo4sLibs"
fi
if [ ! -d "$INCLUDE_DIR/sharedMemory" ]
	then
	mkdir "$INCLUDE_DIR/sharedMemory"
fi
if [ ! -d "$INCLUDE_DIR/logManager" ]
	then
	mkdir "$INCLUDE_DIR/logManager"
fi
if [ ! -d "$INCLUDE_DIR/cryption" ]
	then
	mkdir "$INCLUDE_DIR/cryption"
fi
if [ ! -d "$INCLUDE_DIR/keyManager" ]
	then
	mkdir "$INCLUDE_DIR/keyManager"
fi

export OBJS_DIR
export LIBS_DIR
export INCLUDE_DIR

cp -uf common.h /usr/include/jimant
cp -uf $FO4S_LIBS_DIR/*.h /usr/include/jimant/fo4sLibs
cp -uf $SHARED_MEMORY_DIR/*.h /usr/include/jimant/sharedMemory
cp -uf $LOG_MANAGER_DIR/*.h /usr/include/jimant/logManager
cp -uf $CRYPTION_DIR/*.h /usr/include/jimant/cryption
cp -uf $KEY_MANAGER_DIR/*.h /usr/include/jimant/keyManager
echo "ROOT_PATH : $JIMANT_ROOT_PATH"
echo "WORK_ROOT_PATH : $JIMANT_WORK_ROOT_PATH"
echo "OBJS_DIR : $OBJS_DIR"
echo "LIBS_DIR : $LIBS_DIR"

#if [ `getconf LONG_BIT` = "64" ]; then
#    echo "I'm 64-bit"
#else
#    echo "I'm 32-bit"
#fi

echo "***************"
echo $CRYPTION_DIR
echo $APPROACH_MANAGER_DIR
echo "***************"

# core compile
cd $CRYPTION_DIR
chmod +x make.sh

while test $# -gt 0
do
    case "$1" in
	--with-php)
		./make.sh __PHP__
	;;
	--with-jni)
		./make.sh __JNI__
	;;
	--with-mysql)
		./make.sh __MYSQL__
	;;
	--with-oracle)
		./make.sh __ORACLE__
	;;
	--enable-php-mysql | --enable-php-oracle)
	;;
	*)
		echo "Invalid argument $1"
		exit 3;
	;;
    esac
    shift
done

./make.sh

cd $KEY_MANAGER_DIR
chmod +x make.sh
./make.sh

# approach manager compile
cd $APPROACH_MANAGER_DIR
chmod +x release.sh
./release.sh

cp $APPROACH_MANAGER_DIR/approach /usr/sbin/

echo "--------------- core end ---------------"
