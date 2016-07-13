#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

gcc -fPIC -g -O2 -std=gnu99 -shared -o ../libs/jimant_mysql_cryption.so mysqlCryption.c -I/usr/include/mysql/ -L/usr/lib64/jimant -L/usr/local/lib -Wl,-rpath=/usr/local/lib -lgcrypt -ljimant_mysql_cryption

cp ../libs/jimant_mysql_cryption.so /usr/lib64/mysql/plugin/jimant_mysql_cryption.so

chcon -t texrel_shlib_t /usr/lib64/mysql/plugin/jimant_mysql_cryption.so
