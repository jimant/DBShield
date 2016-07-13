#!/bin/bash

LIB_DIR="$(pwd)/modules"
#EXT_DIR="/usr/local/lib/php/extensions/no-debug-non-zts-20090626"
MODULES_DIR="/usr/lib64/php/modules"

make distclean

phpize
./configure --with-jimant_cryption

make

# Core PHP Library Delete
cp -uf $LIB_DIR/* $MODULES_DIR/

# fo4s test
#php -f jimant_cryption.php
