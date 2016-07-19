/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __CRYPT_COMMON_H__
#define __CRYPT_COMMON_H__

#include "../common.h"

#include <stdio.h>
#include "/usr/local/include/gcrypt.h"
#include <assert.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SECTION_SPLIT_STR		"."
#define SECTION_DATA_SPLIT_STR	","

#define KO_LANG_BYTE	3
#define FO4S_ERROR	"FO4S_ERROR";

struct CryptionInfo{
	char*			key;			///< 암복호화 key
	size_t			keyLength;
	// NULL -> none IV
	char*			ivOrSalt;		///< 암복호화 IV
	size_t			blkLength;

	int 			normalLength;		///< 암호화하지 않을 길이

	char*			maskSection;	///< 마스킹 정보
	char			mask;			///< 마스킹 문자

	gcry_cipher_hd_t	hd;
	int			algo;
	int			mode;
};

struct PermissionInfo{
	char* userName;
	char* adminName;
	struct CryptionInfo cryptionInfo;
	char* dbName;
	char* tableName;
};

#ifdef __cplusplus
}
#endif

#endif
