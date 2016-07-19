#!/bin/bash

gcc -fPIC -g -O2 -std=gnu99 -shared -o ../libs/jimant_oracle_cryption.so oracleCryption.c -L/usr/lib64/jimant  -L/usr/local/lib -Wl,-rpath=/usr/local/lib -lgcrypt -ljimant_oracle_cryption
