/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "decryption.h"

#include "cryptUtils.h"

#include <pthread.h>
#include <errno.h>

char* _decryption(char* data, struct CryptionInfo info);

char* decryption(const char* ip, const char* user
	, const char* threadID
	, const char* programName
	, char* data
	, const char* dbName, const char* tableName, const char* columnName
	, bool* isSuccess)
{
	initLog(threadID, eCryptLogType_Decrypt, ip, user, programName, isSuccess);

	if( data == NULL ) {
		*isSuccess = false;
		return NULL;
	}

	if( !isPossibleCrypt(ip, user, programName) )
	{
                *isSuccess = false;
                return NULL;
	}

	struct CryptionInfo info;
	cryptionInfoInit(&info);

	if( !getCryptPolicy(user, tableName, columnName, &info))
	{
                *isSuccess = false;
                cryptionInfoRelease(info);
                return NULL;
	}

	char* strData = decryptionInfo(data, info);

        if (strData == NULL) {
                *isSuccess = false;
        }
        else
                *isSuccess = true;

	cryptionInfoRelease(info);

	return strData;
}

char* decryptionInfo(char* data, struct CryptionInfo info)
{
	if( data == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Null_Data);
		return NULL;
	}

	if( !isValidCryptionOption(info, false) )
	{
		dbsAccessLog(eCryptLogMessage_Invalid_Option_Decrypt);
		return NULL;
	}

	return _decryption(data, info);
}

char* _decryption(char* data, struct CryptionInfo info)
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

	// check_one_cipher(gcry_algo, gcry_mode, 0);
	cipherOpen(&info);

	int dataLength = strlen(data);
	/*
		DataLength - cipher text length * 2
	*/

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
	int resultLen = tempLen / 2;
	if (resultLen <= 0) resultLen = 1;

	char* inData = (char*)calloc(resultLen + normalLength, sizeof(char));
	unsigned char* hexsData = strToHexsWithRange(data, normalLength, (resultLen * 2) + normalLength);
	memcpy(inData, hexsData, resultLen + normalLength);
	free(hexsData);

	if(normalLength >= dataLength || 
		( error = gcry_cipher_decrypt(info.hd
		, &inData[normalLength]
		, resultLen, NULL, 0) ))
	{
		free(inData);

		if( error )
		{
			dbsAccessLog(eCryptLogMessage_Fail_Decrypt);
		}
		else
		{
			dbsAccessLog(eCryptLogMessage_Over_Normal_To_Data);
		}
		return NULL;
	}

	char* tempOutData = (char*)calloc(resultLen + normalLength, sizeof(char));
	memcpy(tempOutData, inData, resultLen + normalLength);

	char* outData = (char*)calloc(resultLen + normalLength, sizeof(char));

	char* maskSection = info.maskSection;

	if( maskSection )
	{
		char mask = info.mask;

		int maskSectionsCnt = 0;
		char** maskSections = strSplit(maskSection, SECTION_SPLIT_STR, &maskSectionsCnt);

		short* sectionData = (short*)calloc(maskSectionsCnt * 2, sizeof(short));

		for(int i = 0 ; i < maskSectionsCnt ; ++i)
		{
			char** section = strSplit(maskSections[i], SECTION_DATA_SPLIT_STR, NULL);

			sectionData[i * 2] = atoi(section[0]);
			sectionData[i * 2 + 1] = atoi(section[1]);

			freeSplit(section, 2);
		}

		freeSplit(maskSections, maskSectionsCnt);

		short koreanLength = strlen("ㄱ");
		short englishLength = strlen("a");

		int outDataIndex = 0;
		int outDataLength = 0;
		for(int i = 0 ; i < resultLen + normalLength ; )
		{
			char singleData = tempOutData[i];
			short singleDataSize = ((singleData & 0x80) == 0x80) ? koreanLength : englishLength;
			bool isInnerSection = false;

			for(int j = 0 ; j < maskSectionsCnt ; ++j)
			{
				short sectionStart = sectionData[j * 2];
				short sectionEnd = sectionData[j * 2 + 1];

				if( outDataLength >= sectionStart - 1 && outDataLength <= sectionEnd - 1 )
				{
					isInnerSection = true;
					break;
				}
			}

			++outDataLength;

			if( isInnerSection )
			{
				outData[outDataIndex] = mask;
				++outDataIndex;
			}
			else
			{
				for(int singleDataIndex = 0 ; singleDataIndex < singleDataSize ; ++singleDataIndex)
					outData[outDataIndex + singleDataIndex] = tempOutData[i + singleDataIndex];
				outDataIndex += singleDataSize;
			}

			i += singleDataSize;
		}

		free(sectionData);
	}
	else
		memcpy(outData, tempOutData, resultLen + normalLength);

	gcry_cipher_close(info.hd);
	free(inData);
	free(tempOutData);

	dbsAccessLog(eCryptLogMessage_Allow);

	return outData;
}
