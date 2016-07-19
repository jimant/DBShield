#/bin/bash

rm -rf keyManager
gcc -g -O0 -std=gnu99 -Wall -I/usr/include/mysql -L/usr/lib64/mysql -L/usr/local/lib ../fo4sLibs/fo4sLibs.c ../sharedMemory/sharedMemory.c ../logManager/logManager.c ../cryption/cryptUtils.c ../cryption/encryption.c ../cryption/decryption.c keyManager.c main.c -o keyManager -Wl,-rpath=/usr/local/lib -lgcrypt -lmysqlclient
