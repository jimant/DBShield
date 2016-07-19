#/bin/bash

rm -rf keyManager
# fo4s
#gcc -DDEBUG_MODE -g -O0 -std=gnu99 -Wall -I/usr/include/mysql -L/usr/lib/mysql ../sharedMemory.c ../cryption/cryptUtils.c ../cryption/encryption.c ../cryption/decryption.c keyManager.c main.c -o keyManager -lgcrypt -lgpg-error -lmysqlclient
gcc -DDEBUG_MODE -g -O0 -std=gnu99 -Wall -I/usr/include/mysql -L/usr/lib/mysql -L/usr/local/lib ../sharedMemory.c ../cryption/cryptUtils.c ../cryption/encryption.c ../cryption/decryption.c keyManager.c main.c -o keyManager -Wl,-rpath=/usr/local/lib/gcrypt -lgcrypt -lmysqlclient
