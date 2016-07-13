/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __LOG_MANAGER_H__
#define __LOG_MANAGER_H__

#include "logCommon.h"

#define LOG_SPLIT_STR		"|"
#define LOG_DATA_SPLIT_STR	","

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	eCryptLogMessage_Allow = 0,	///< allow encryption, decryption

	eCryptLogMessage_Fail_Handle_Open,
	eCryptLogMessage_Fail_Encrypt,
	eCryptLogMessage_Fail_Decrypt,

	eCryptLogMessage_Not_Register_Global,		///< Global
	eCryptLogMessage_Not_Register_Column,
	eCryptLogMessage_Not_Register_Key,
	eCryptLogMessage_Not_Register_Behavior,
	eCryptLogMessage_Not_Register_Policy,

	eCryptLogMessage_Not_Possible_Crypt,

	eCryptLogMessage_Null_Data,
	eCryptLogMessage_Null_IP,
	eCryptLogMessage_Null_User,

	eCryptLogMessage_Invalid_Option,
	eCryptLogMessage_Invalid_Option_None_Algorithm,
	eCryptLogMessage_Invalid_Option_None_Mode,
	eCryptLogMessage_Invalid_Option_Encrypt,
	eCryptLogMessage_Invalid_Option_Decrypt,

	eCryptLogMessage_Over_Normal_To_Data,
	eCryptLogMessage_Over_Behavior	///< exist data block, delimiter = ,
}eCRYPT_LOG_MESSAGE;

typedef enum {
	eCryptLogType_NONE,		///< Type NONE
	eCryptLogType_Encrypt,	///< Encrypt
	eCryptLogType_Decrypt,	///< Decrypt
	eCryptLogType_KEK,		///< Key Encrypt Key
	eCryptLogType_EK,		///< Encrypt Key
	eCryptLogType_REK		///< Regenerate Encrypt Key
}eCRYPT_LOG_TYPE;

void initSimpleLog(eCRYPT_LOG_TYPE logType);
void initLog(const char* threadID, eCRYPT_LOG_TYPE logType
	, const char* accessIP, const char* accessUser
	, const char* programName
	, bool* isSuccess);

void setCryptLogThreadID(const char* threadID);
const char* getCryptLogThreadID();

void setCryptLogType(eCRYPT_LOG_TYPE type);
eCRYPT_LOG_TYPE getCryptLogType();

void setCryptLogAccessIP(const char* accessIP);
const char* getCryptLogAccessIP();

void setCryptLogAccessUser(const char* accessUser);
const char* getCryptLogAccessUser();

void setCryptLogProgramName(const char* programName);
const char* getCryptLogProgramName();

/**
 *	@brief 에러 로그 함수
 *
 *	@param message 		로그 메시지
 */
void errorLog(const char* message);

void denyLog(const char* message);
void allowLog(const char* message);

void dbsAccessLog(eCRYPT_LOG_MESSAGE message);
char* readCryptLogMessage(eCRYPT_LOG_MESSAGE message);

char* readCryptLogMessageWithData(eCRYPT_LOG_MESSAGE message, void* data);

#ifdef __cplusplus
}
#endif

#endif
