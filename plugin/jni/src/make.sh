#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#
 
#!/bin/bash

javac JniKeyEncrypt.java -d .

javah encryption.JniKeyEncrypt

gcc -fPIC -O2 -std=gnu99 -shared -o ../libs/libJniKeyEncrypt.so JniKeyEncrypt.c -I /usr/lib/jvm/java-1.7.0-openjdk.x86_64/include/ -I /usr/lib/jvm/java-1.7.0-openjdk.x86_64/include/linux -L/usr/lib64/jimant -L/usr/local/lib -Wl,-rpath=/usr/local/lib -lgcrypt -ljimant_jni_cryption -ljimant_key_manager

if [ ! -d /usr/lib64/jimant/jni ]
then
mkdir /usr/lib64/jimant/jni
fi

cp ../libs/libJniKeyEncrypt.so /usr/lib64/jimant/jni/libJniKeyEncrypt.so



