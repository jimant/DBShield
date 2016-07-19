/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __ENCRYPTION_H__
#define __ENCRYPTION_H__

#include "cryptCommon.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 *	@brief 정책에 따라 암호화 하는 함수
 *
 *	@param data 		암호화할 데이터
 *	@param dbName 		데이터가 있는 데이터베이스명
 *	@param tableName 	데이터가 있는 데이블명
 *	@param columnName 	데이터가 있는 컬럼명
 *
 *	@return 			정책에따라 암호화된 데이터
 */

// mysql, oracle 지원 - PHP 같은 컴파일된 Lib 사용시 Function 분기처리 불편
char* encryption(const char* ip, const char* user
	, const char* threadID
	, const char* programName
	, char* data
	, const char* dbName, const char* tableName, const char* columnName
	, bool* isSuccess);

/**
 *	@brief 정해진 옵션에 맞춰 암호화 하는 함수
 *
 *	@param data 		암호화할 데이터
 *	@param CryptionInfo 암호화 옵션
 *
 *	@return 			옵션에 따라 암호화된 데이터
 */
char* encryptionInfo(char* data, struct CryptionInfo info);

/**
 *	@brief HASH 암호화 함수
 *
 *	@param data 		암호화할 데이터
 *	@param salt 		HASH 할때 추가하는 salt
 *
 *	@return 			HASH 된 데이터
 */
char* encryptionSHA256(const char* data, const char* salt);

#ifdef __cplusplus
}
#endif

#endif
