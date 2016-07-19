/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "keyManager.h"

#include <stdio.h>

#include "../cryption/cryptUtils.h"
#include "../cryption/encryption.h"
#include "../cryption/decryption.h"

char* generateKeyEncryptKey(const char* key)
{
	initSimpleLog(eCryptLogType_KEK);
	size_t keyLen = gcry_cipher_get_algo_keylen(GCRY_CIPHER_AES128);

	unsigned char* tmpRng = getRNG(keyLen);
	char* rng = hexsToStrWithLength(tmpRng, keyLen);
	free(tmpRng);

	char* tmpKek = encryptionSHA256(key, rng);

	free(rng);

	char* kek = (char*)calloc(256, sizeof(char));
	memcpy(kek, tmpKek, keyLen * 2);

	free(tmpKek);

	return kek;
}

char* generateEncryptKey(const char* key, const char* kek)
{
	initSimpleLog(eCryptLogType_EK);

	char* oriKey = generateKeyEncryptKey(key);

	struct CryptionInfo info;
	cryptionInfoInit(&info);

	info.algo = GCRY_CIPHER_AES128;
	info.mode = GCRY_CIPHER_MODE_ECB;

	size_t kekLength = strlen(kek);
	info.key = (char*)calloc(kekLength, sizeof(char));
	memcpy(info.key, kek, kekLength);

	// struct CryptionInfo info = {eCryptionOption_ALGO_AES | eCryptionOption_MODE_ECB, kek, NULL};
	char* tmpEk = encryptionInfo(oriKey, info);

	free(oriKey);

	char* ek = (char*)calloc(256, sizeof(char));
	memcpy(ek, tmpEk, strlen(tmpEk));

	free(tmpEk);

	return ek;
}

char* regenerateEncryptKey(const char* encryptKey, const char* oldKek, const char* newKek)
{
	initSimpleLog(eCryptLogType_REK);

	struct CryptionInfo oldInfo;
	cryptionInfoInit(&oldInfo);

	oldInfo.algo = GCRY_CIPHER_AES128;
	oldInfo.mode = GCRY_CIPHER_MODE_ECB;

	size_t oldKekLength = strlen(oldKek);
	oldInfo.key = (char*)calloc(oldKekLength, sizeof(char));
	memcpy(oldInfo.key, oldKek, oldKekLength);

	struct CryptionInfo newInfo;
	cryptionInfoInit(&newInfo);

	newInfo.algo = GCRY_CIPHER_AES128;
	newInfo.mode = GCRY_CIPHER_MODE_ECB;

	size_t newKekLength = strlen(newKek);
	newInfo.key = (char*)calloc(newKekLength, sizeof(char));
	memcpy(newInfo.key, newKek, newKekLength);

	char* decEk = decryptionInfo((char*)encryptKey, oldInfo);
	char* encEk = encryptionInfo(decEk, newInfo);

	free(decEk);

	char* ek = (char*)calloc(256, sizeof(char));
	memcpy(ek, encEk, strlen(encEk));

	free(encEk);

	return ek;
}
