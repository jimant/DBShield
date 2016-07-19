#/bin/bash

LIB_FULL_NAME="libjimant_key_manager"
SHARED_LIB_FULL_NAME="$LIB_FULL_NAME.so.1.0.0"
SHARED_LIB_LINK_NAME="$LIB_FULL_NAME.so"
SHARED_LIB_DYNAMIC_LINK_NAME="$LIB_FULL_NAME.so.1"

rm -rf /usr/lib64/jimant/$SHARED_LIB_FULL_NAME
rm -rf /usr/lib64/jimant/$SHARED_LIB_LINK_NAME
rm -rf /lib64/$SHARED_LIB_DYNAMIC_LINK_NAME

gcc -fPIC -O2 -std=gnu99 -c keyManager.c -o keyManager.o -L/usr/lib64/jimant -L/usr/local/lib -Wl,-rpath=/usr/local/lib -lgcrypt -ljimant_cryption

gcc -shared -W1,-soname,$SHARED_LIB_DYNAMIC_LINK_NAME -o /usr/lib64/jimant/$SHARED_LIB_FULL_NAME keyManager.o

ln -s /usr/lib64/jimant/$SHARED_LIB_FULL_NAME /usr/lib64/jimant/$SHARED_LIB_LINK_NAME
ln -s /usr/lib64/jimant/$SHARED_LIB_FULL_NAME /lib64/$SHARED_LIB_DYNAMIC_LINK_NAME

rm -rf keyManager.o

ldconfig
