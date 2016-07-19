/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __DECRYPTION_H__
#define __DECRYPTION_H__

#include "cryptCommon.h"

#ifdef __cplusplus
extern "C" {
#endif

// Decryption
char* decryption(const char* ip, const char* user
	, const char* threadID
	, const char* programName
	, char* data
	, const char* dbName, const char* tableName, const char* columnName
	, bool* isSuccess);

char* decryptionInfo(char* data, struct CryptionInfo info);

#ifdef __cplusplus
}
#endif

#endif
