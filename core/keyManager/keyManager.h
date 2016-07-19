/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __KEY_MANAGER_H__
#define __KEY_MANAGER_H__

#include "keyCommon.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 *	@brief Key Encrypt Key (KEK)를 재/생성해주는 함수
 *
 *	@param key 			SHA256 암호화를 할때 사용되는 data 부분
 *
 *	@return 			Key Encrypt Key (KEK)
 */
char* generateKeyEncryptKey(const char* key);

/**
 *	@brief Encrypt Key를 생성해주는 함수
 *
 *	@param kek 			Key Encrypt Key
 *	@param key 			SHA256 암호화를 할때 사용되는 data 부분
 *
 *	@return 			Encrypt Key
 */
char* generateEncryptKey(const char* kek, const char* key);

/**
 *	@brief Encrypt Key를 재생성 해주는 함수
 *
 *	@param encryptKey 	기존에 생성된 Encrypt Key
 *	@param oldKek 		이전 KEK
 *	@param newKek		새로운 KEK
 *
 *	@return 			재생성 만들어진 Encrypt Key
 */
char* regenerateEncryptKey(const char* encryptKey, const char* oldKek, const char* newKek);

#ifdef __cplusplus
}
#endif

#endif
