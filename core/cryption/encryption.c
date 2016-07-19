/* 
  * 
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  * 
  * Licensed under the LGPL v3 see the file LICENSE in base directory. 
  * 
*/ 
 
#include "encryption.h"

#include "cryptUtils.h"

#include <pthread.h>
#include <errno.h>

char* _encryption(char* data, struct CryptionInfo info);

char* encryption(const char* ip, const char* user
	, const char* threadID
	, const char* programName
	, char* data
	, const char* dbName, const char* tableName, const char* columnName
	, bool* isSuccess)
{
	/* Null Constraint check , initial value set */
	initLog(threadID, eCryptLogType_Encrypt, ip, user, programName, isSuccess);

	if( data == NULL ) {
		*isSuccess = false;
		return NULL;
	}

	/* Access Control (Policy, Behavior) */
	if( !isPossibleCrypt(ip, user, programName) )
	{
		*isSuccess = false;
		return NULL;
	}

	struct CryptionInfo info;
	cryptionInfoInit(&info);

	/* get Key, Cryption Information */
	if( !getCryptPolicy(user, tableName, columnName, &info))
	{
		*isSuccess = false;
		cryptionInfoRelease(info);
		return NULL;
	}

	char* strData = encryptionInfo(data, info);

	cryptionInfoRelease(info);

	if (strData == NULL)
		*isSuccess = false;
	else
		*isSuccess = true;
	return strData;
}

/**
 *
 *		encryptionData
 *
 *		generateEncryptKey
 *
 *		regenerateEncryptKey
 *
 *
 */
char* encryptionInfo(char* data, struct CryptionInfo info)
{
	if( data == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Null_Data);
		return NULL;
	}

	if( !isValidCryptionOption(info, true) )
	{
		dbsAccessLog(eCryptLogMessage_Invalid_Option_Encrypt);
		return NULL;
	}

	if( info.algo == GCRY_MD_SHA256 && info.mode == GCRY_CIPHER_MODE_NONE )
	{
		return  encryptionSHA256(data, info.ivOrSalt);
	}
	else
		return _encryption(data, info);
}

char* encryptionSHA256(const char* data, const char* salt)
{

	if( data == NULL )
		return NULL;

	size_t dataLength = strlen(data);
	size_t saltLength = 0;
	if( salt != NULL )
		saltLength = strlen(salt);

	char* saltedData = (char*)calloc(dataLength + saltLength + 1, sizeof(char));

	if( salt != NULL )
	{
		memcpy(saltedData, salt, saltLength);
		memcpy(&saltedData[saltLength], data, dataLength);
	}
	else
		memcpy(saltedData, data, dataLength);

	gcry_md_hd_t mdHandle;
	gcry_md_open(&mdHandle, GCRY_MD_SHA256, 0);
	if( mdHandle == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Fail_Handle_Open);
		free(saltedData);
		return NULL;
	}

	//size_t dataLen = strlen( data );
	size_t dataLen = strlen( saltedData );
	size_t hashLen = gcry_md_get_algo_dlen( GCRY_MD_SHA256 );

	unsigned char* hash = (unsigned char*)calloc(hashLen, sizeof(unsigned char));

	gcry_md_hash_buffer(GCRY_MD_SHA256, hash, saltedData, dataLen);

	char* outData = (char*)calloc(hashLen * 2 + 1, sizeof(char));

	char* p = outData;
	for(int i = 0 ; i < hashLen ; ++i, p += 2) {
		snprintf(p, 3, "%02X", hash[i]);
	}


	free(saltedData);
	free(hash);

	gcry_md_close(mdHandle);

	return outData;
}

char* _encryption(char* data, struct CryptionInfo info)
{
	if( data == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Null_Data);
		return NULL;
	}

	/*
        const char* ver = gcry_check_version(GCRYPT_VERSION);
        if (!ver)
        {
                errorLog("libgcrypt version mismatch!!");
        }  
	*/
	gcry_error_t error = 0;
	/*
        error = gcry_control(GCRYCTL_ANY_INITIALIZATION_P);
        if (error==0)
        {
                errorLog("libgcrypt has not been initialized!!");
        }
	*/

	cipherOpen(&info);

	int dataLength = strlen(data);
	int normalLength = info.normalLength;
        if (info.normalLength != 0) {
		for(int i = 0 ; i < normalLength ; ++i)
		{
			if( (data[i] & 0x80) == 0x80 )
			{
				//normalLength += 2;
				normalLength += (KO_LANG_BYTE -1);
				i += 2;
			}
		}
	}

	int tempLen = dataLength - normalLength;
	int padding = 0;
	int paddingModBlkLength = tempLen % info.blkLength;
	if( paddingModBlkLength != 0 )
		padding = info.blkLength - paddingModBlkLength;
	int resultLen = tempLen + padding;

	unsigned char* inData = (unsigned char*)calloc(resultLen + normalLength + 1, sizeof(unsigned char));
	memcpy(inData, data, dataLength);

	if(normalLength >= dataLength ||
		( error = gcry_cipher_encrypt(info.hd
		, &inData[normalLength]
		, resultLen, NULL, 0) ))
	{
		free(inData);
		
		if( error )
		{
			dbsAccessLog(eCryptLogMessage_Fail_Encrypt);
		}
		else
		{
			dbsAccessLog(eCryptLogMessage_Over_Normal_To_Data);
		}

		return NULL;
	}

	char* outData = hexsToStrWithRange(inData, normalLength, resultLen + normalLength);

	gcry_cipher_close(info.hd);
	free(inData);

	dbsAccessLog(eCryptLogMessage_Allow);

	return outData;
}
