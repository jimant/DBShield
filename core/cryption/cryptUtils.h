/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __CRYPT_UTILS_H__
#define __CRYPT_UTILS_H__

#include "cryptCommon.h"

#ifdef __cplusplus
extern "C" {
#endif

void cryptionInfoInit(struct CryptionInfo* info);
void cryptionInfoRelease(struct CryptionInfo info);

size_t getAlgoKeyLength(int algo);
size_t getAlgoBlkLength(int algo);

bool checkGcryptError(gcry_error_t gcryError, char* descryption);

bool cipherOpen(struct CryptionInfo* info);

bool cryptInit(void** globalCryptSM, void** cryptSM, void** keySM);
bool cryptRelease(void* globalCryptSM, void* cryptSM, void* keySM);

bool isValidCryptionOption(struct CryptionInfo info, bool isEncryption);

bool isPossibleCrypt(const char* ip, const char* user, const char* program);
bool isWorkApprove(const char* ip, const char* user);
//int isPossibleBehavior(const char* ip, const char* user);
bool isPossiblePolicy(const char* ip, const char* user, const char* program);

bool getCryptPolicy(const char* user, const char* tableName, const char* columnName, struct CryptionInfo* info);


unsigned char* getRNG(size_t length);

char* plainToHex(const char* plain);

// hex -> str
char* hexToStr(unsigned char hex);
char* hexsToStrWithRange(unsigned char* hexs, size_t start, size_t end);
char* hexsToStrWithLength(unsigned char* hexs, size_t length);
char* hexsToStr(unsigned char* hexs);

// str -> hex
unsigned char strToHex(const char* str);
unsigned char* strToHexsWithRange(const char* str, size_t start, size_t end);
unsigned char* strToHexsWithLength(const char* str, size_t length);
unsigned char* strToHexs(const char* str);

#ifdef __cplusplus
}
#endif

#endif
