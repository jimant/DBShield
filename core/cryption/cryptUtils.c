/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "cryptUtils.h"

void cryptionInfoInit(struct CryptionInfo* info)
{
	info->key = NULL;
	info->keyLength = 0;
	info->ivOrSalt = NULL;
	info->blkLength = 0;
	info->normalLength = 0;
	info->maskSection = NULL;
	info->mask = '\0';
	info->hd = NULL;
	info->algo = GCRY_CIPHER_NONE;
	info->mode = GCRY_CIPHER_MODE_NONE;
}

void cryptionInfoRelease(struct CryptionInfo info)
{
	if( info.key )
	{
		free(info.key);
		info.key = NULL;
	}
	if( info.ivOrSalt )
	{
		free(info.ivOrSalt);
		info.ivOrSalt = NULL;
	}
	if( info.maskSection )
	{
		free(info.maskSection);
		info.maskSection = NULL;
	}
	/*
	if( info.hd )
	{
		gcry_cipher_close(info.hd);
		info.hd = NULL;
	}
	*/
}

size_t getAlgoKeyLength(int algo)
{
	return gcry_cipher_get_algo_keylen(algo);
}

size_t getAlgoBlkLength(int algo)
{
	return gcry_cipher_get_algo_blklen(algo);
}

bool checkGcryptError(gcry_error_t gcryError, char* descryption)
{
	if( gcryError )
	{
		printf("%s : %s / %s\n", descryption, gcry_strsource(gcryError), gpg_strerror(gcryError));
		return true;
	}

	return false;
}

bool cipherOpen(struct CryptionInfo* info)
{
	gcry_error_t error;

	if(( error = gcry_cipher_open(&info->hd, info->algo, info->mode, 0) ))
	{
		dbsAccessLog(eCryptLogMessage_Fail_Handle_Open);
		return false;
	}

	info->keyLength = gcry_cipher_get_algo_keylen(info->algo);
	info->blkLength = gcry_cipher_get_algo_blklen(info->algo);

	if( info->ivOrSalt )
	{
		gcry_cipher_setiv(info->hd, info->ivOrSalt, info->blkLength);
	}

	if( info->key )
	{
		unsigned char buf[256] = {'\0', };
		unsigned char* hexs = strToHexsWithLength(info->key, info->keyLength * 2);
		memcpy(buf, hexs, info->keyLength);
		free(hexs);

		gcry_cipher_setkey(info->hd, buf, info->keyLength);
	}

	return true;
}

bool cryptInit(void** globalCryptSM, void** cryptSM, void** keySM)
{
	*globalCryptSM = getSharedMemory(GLOBAL_POLICY_SHARED_MEMORY_KEY, GLOBAL_POLICY_SHARED_MEMORY_SIZE);
	*cryptSM = getSharedMemory(CRYPT_POLICY_SHARED_MEMORY_KEY, CRYPT_POLICY_SHARED_MEMORY_SIZE);
	*keySM = getSharedMemory(KEY_SHARED_MEMORY_KEY, KEY_SHARED_MEMORY_SIZE);

	if( *globalCryptSM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Global);
		cryptRelease(*globalCryptSM, *cryptSM, *keySM);
		return false;
	}

	if( *cryptSM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Column);
		cryptRelease(*globalCryptSM, *cryptSM, *keySM);
		return false;
	}

	if( *keySM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Key);
		cryptRelease(*globalCryptSM, *cryptSM, *keySM);
		return false;
	}

	return true;
}

bool cryptRelease(void* globalCryptSM, void* cryptSM, void* keySM)
{
	if( releaseSharedMemory(globalCryptSM) & 
		releaseSharedMemory(cryptSM) & 
		releaseSharedMemory(keySM) )
		return true;

	errorLog("Shared memory release failed");
	return false;
}

bool isValidCryptionOption(struct CryptionInfo info, bool isEncryption)
{
	if( (info.algo == GCRY_CIPHER_NONE) )
	{
		dbsAccessLog(eCryptLogMessage_Invalid_Option_None_Algorithm);
		return false;
	}

	if( info.mode == GCRY_CIPHER_MODE_NONE )
	{
		if( info.algo == GCRY_MD_SHA256 && isEncryption )
			return true;
		else
			return false;
	}
	else
	{
		if( info.algo == GCRY_CIPHER_AES128 || info.algo == GCRY_CIPHER_SEED )
			return true;
		else
			return false;
	}

	dbsAccessLog(eCryptLogMessage_Invalid_Option);
	return false;
}

bool isBelongTime(const char* strStartTime, const char* strEndTime)
{
	struct tm* t = getTime();
	time_t currentTimeT = mktime(t);

	int startYear = 1900;
	int startMonth = 1;
	int startDay = 1;

	int startHour = 0;
	int startMinute = 0;
	int startSecond = 0;
	if( strncmp(strStartTime, "ALL", 3) != 0 )
	{
		char* smStartTime = (char*)strStartTime;

		char startTimeBuf[4] = {'\0', };

		memcpy(startTimeBuf, smStartTime, 4);
		startYear = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);

		memcpy(startTimeBuf, smStartTime + 4, 2);
		startMonth = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);

		memcpy(startTimeBuf, smStartTime + 6, 2);
		startDay = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);

		memcpy(startTimeBuf, smStartTime + 8, 2);
		startHour = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);

		memcpy(startTimeBuf, smStartTime + 10, 2);
		startMinute = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);

		memcpy(startTimeBuf, smStartTime + 12, 2);
		startSecond = atoi(startTimeBuf);
		memset(startTimeBuf, '\0', 4);
	}

	struct tm startTime;
	memset(&startTime, 0, sizeof(startTime));
	startTime.tm_year = startYear - 1900;
	startTime.tm_mon = startMonth - 1;
	startTime.tm_mday = startDay;
	startTime.tm_hour = startHour;
	startTime.tm_min = startMinute;
	startTime.tm_sec = startSecond;

	time_t startTimeT = mktime(&startTime);


	int endYear = 9999;
	int endMonth = 12;
	int endDay = 31;

	int endHour = 23;
	int endMinute = 59;
	int endSecond = 59;
	if( strncmp(strEndTime, "ALL", 3) != 0 )
	{
		char* smEndTime = (char*)strEndTime;

		char endTimeBuf[4] = {'\0', };

		memcpy(endTimeBuf, smEndTime, 4);
		endYear = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);

		memcpy(endTimeBuf, smEndTime + 4, 2);
		endMonth = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);

		memcpy(endTimeBuf, smEndTime + 6, 2);
		endDay = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);

		memcpy(endTimeBuf, smEndTime + 8, 2);
		endHour = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);

		memcpy(endTimeBuf, smEndTime + 10, 2);
		endMinute = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);

		memcpy(endTimeBuf, smEndTime + 12, 2);
		endSecond = atoi(endTimeBuf);
		memset(endTimeBuf, '\0', 4);
	}

	struct tm endTime;
	memset(&endTime, 0, sizeof(endTime));
	endTime.tm_year = endYear - 1900;
	endTime.tm_mon = endMonth - 1;
	endTime.tm_mday = endDay;
	endTime.tm_hour = endHour;
	endTime.tm_min = endMinute;
	endTime.tm_sec = endSecond;
	time_t endTimeT = mktime(&endTime);

	#if DEBUG_MODE
		printf("Current : %d-%d-%d %d:%d:%d\n", t->tm_year, t->tm_mon, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
		printf("Start : %d-%d-%d %d:%d:%d\n", startTime.tm_year, startTime.tm_mon, startTime.tm_mday, startTime.tm_hour, startTime.tm_min, startTime.tm_sec);
		printf("End : %d-%d-%d %d:%d:%d\n", endTime.tm_year, endTime.tm_mon, endTime.tm_mday, endTime.tm_hour, endTime.tm_min, endTime.tm_sec);
	#endif

	double startDiff = difftime(currentTimeT, startTimeT);
	double endDiff = difftime(currentTimeT, endTimeT);

	if( startDiff >= 0 && endDiff <= 0 )
		return true;

	return false;
}

bool isPossibleCrypt(const char* ip, const char* user, const char* program)
{
	if( ip == NULL || strlen(ip) < 1 )
	{
		dbsAccessLog(eCryptLogMessage_Null_IP);
		return false;
	}

	if( user == NULL || strlen(user) < 1 )
	{
		dbsAccessLog(eCryptLogMessage_Null_User);
		return false;
	}
	if( isWorkApprove(ip, user) )
	{
		return true;
	}

	// 1.1 ~ 1.5
	if( isPossiblePolicy(ip, user, program) )
	{
		/*
		// 2.0 ~ 3.0
		int behaviorResult = isPossibleBehavior(ip, user);
		// 행위기반에 등록되어있지않음
		if( behaviorResult == 0 )
			return true;
		// 행위기반에 등록되어있으며, 행위기반 통과
		else if( behaviorResult == 1 )
			return true;
		// 행위기반에 등록되어있지만, 행위기반 초과
		else if( behaviorResult == 2 )
		{
			dbsAccessLog(eCryptLogMessage_Not_Possible_Crypt);
			return false;
		}
		*/
		return true;
	}
	dbsAccessLog(eCryptLogMessage_Not_Possible_Crypt);

	return false;
}

/**
 *
 *	0 - REQUEST_TIME
 *	1 - REQUEST_ID
 *	2 - WORK_DB_USER
 *	3 - WORK_IP
 *	4 - WORK_START_TIME
 *	5 - WORK_END_TIME
 *	6 - APPROVE_ADMIN_ID
 *	7 - APPROVE_TIME
 *	8 - SYSTEM_APPLY_DATE
 *	9 - WORK_CONTROL_ID
 */
bool isWorkApprove(const char* ip, const char* user)
{
	size_t ipLen = strlen(ip);
	size_t userLen = strlen(user);

	bool isSuccess = false;

	void* workApproveSM = getSharedMemory(WORK_CONTROL_SHARED_MEMORY_KEY, WORK_CONTROL_SHARED_MEMORY_SIZE);
	if( workApproveSM == NULL )
		return false;

	int workApproveCnt = 0;
	char** workApprove = strSplit(workApproveSM, LINE_SPLIT_STR, &workApproveCnt);
	for(int i = 0 ; i < workApproveCnt ; ++i)
	{
		int workApproveDataCnt = 0;
		char** workApproveData = strSplit(workApprove[i], DATA_SPLIT_STR, &workApproveDataCnt);
		const char* smIP = workApproveData[3];
		const char* smUser = workApproveData[2];
		const char* smStartTime = workApproveData[4];
		const char* smEndTime = workApproveData[5];

		if( strncmp(ip, smIP, ipLen) != 0 || strncmp(user, smUser, userLen) != 0 )
		{
			freeSplit(workApproveData, workApproveDataCnt);
			continue;
		}

		if( isBelongTime(smStartTime, smEndTime) )
		{
			freeSplit(workApproveData, workApproveDataCnt);
			isSuccess = true;
			break;
		}
		freeSplit(workApproveData, workApproveDataCnt);
	}

	freeSplit(workApprove, workApproveCnt);
	releaseSharedMemory(workApproveSM);

	return isSuccess;
}

bool isPossiblePolicy(const char* ip, const char* user, const char* program)
{
	bool isSuccess = false;

	void* policySM = getSharedMemory(ACCESS_POLICY_SHARED_MEMORY_KEY, ACCESS_POLICY_SHARED_MEMORY_SIZE);
	if( policySM == NULL )
	{
		errorLog("cannot access Access Policy Shared Memory");
		// fo4s add a line below
		releaseSharedMemory(policySM);
		return false;
	}

	size_t policySMLength = strlen((char*)policySM);

	if( policySMLength == 0 )
	{
		errorLog("not register access policy");
		releaseSharedMemory(policySM);
		return false;
	}

	int ipLen = strlen(ip);
	int userLen = strlen(user);

	int policyReplaceIndex = 0;
	int policyCnt = 0;
	char** policy = strSplitWithLength(policySM, policySMLength, LINE_SPLIT_STR, &policyCnt);
	for(int i = 0 ; i < policyCnt ; ++i)
	{
		if( i > 0 )
			policyReplaceIndex += strlen(LINE_SPLIT_STR);

		int policyDataLength = strlen(policy[i]);
		int policyDataCnt = 0;
		char** policyData = strSplitWithLength(policy[i], policyDataLength, DATA_SPLIT_STR, &policyDataCnt);

		if( !(strncmp(policyData[0], "ALL", 3) == 0 || strncmp(policyData[0], ip, ipLen) == 0) ||
		 	!(strncmp(policyData[1], "ALL", 3) == 0 || strncmp(policyData[1], user, userLen) == 0))
		{
			policyReplaceIndex += policyDataLength;

			freeSplit(policyData, policyDataCnt);
			continue;
		}

		int	programLen = strlen(policyData[4]);

		if( program != NULL && !(strncmp(policyData[4], "ALL", 3) == 0 || strncmp(policyData[4], program, programLen) == 0) )
		{
			policyReplaceIndex += policyDataLength;

			freeSplit(policyData, policyDataCnt);
			continue;
		}

		if( isBelongTime(policyData[2], policyData[3]) )
		{
			freeSplit(policyData, policyDataCnt);
			isSuccess = true;
			break;
		}
		freeSplit(policyData, policyDataCnt);
	}

	freeSplit(policy, policyCnt);

	if( releaseSharedMemory(policySM) )
	{
		return isSuccess;
	}

	errorLog("Shared release failed - isPossiblePolicy");
	return isSuccess;
}
/*
int isPossibleBehavior(const char* ip, const char* user)
{
	int result = 0;
	bool isFindBehavior = false;

	void* userBehaviorSM = getSharedMemory(USER_BEHAVIOR_SHARED_MEMORY_KEY, USER_BEHAVIOR_SHARED_MEMORY_SIZE);
	if( userBehaviorSM == NULL )
	{
		// fo4s add a line below
		releaseSharedMemory(userBehaviorSM);
		errorLog("cannot access User Behavior Shared Memory");
		return -1;
	}

	// 행위기반 접근제어
	void* behaviorSM = getSharedMemory(ACCESS_BEHAVIOR_SHARED_MEMORY_KEY, ACCESS_BEHAVIOR_SHARED_MEMORY_SIZE);
	if( behaviorSM == NULL )
	{
		releaseSharedMemory(userBehaviorSM);
		errorLog("cannot access Access Behavior Shared Memory");
		return -1;
	}

	struct tm* t = getTime();
	time_t currentTime = mktime(t);

	size_t userBehaviorSMLength = strlen((char*)userBehaviorSM);
	size_t behaviorSMLength = strlen((char*)behaviorSM);

	// 행위기반 접근 제어
	int behaviorCnt = 0;
	char** behavior = strSplitWithLength(behaviorSM, behaviorSMLength, LINE_SPLIT_STR, &behaviorCnt);
	for(int i = 0 ; i < behaviorCnt ; ++i)
	{
		// 정책 데이터를 분리
		int behaviorDataCnt = 0;
		char** behaviorData = strSplit(behavior[i], DATA_SPLIT_STR, &behaviorDataCnt);

		if( behaviorData[0] == NULL || behaviorData[1] == NULL )
			continue;

		char* behaviorIP = behaviorData[0];
		char* behaviorUser = behaviorData[1];

		// User Behavior check for register to DB
		// IP -> ALL or, user -> ALL
		if( !(strncmp(behaviorIP, "ALL", 3) == 0 || strncmp(behaviorIP, ip, strlen(ip)) == 0) ||
			!(strncmp(behaviorUser, "ALL", 3) == 0 || strncmp(behaviorUser, user, strlen(user)) == 0) )
		{
			freeSplit(behaviorData, behaviorDataCnt);
			continue;
		}

		const int smallTime = atoi(behaviorData[2]);
		const int smallTimeCnt = atoi(behaviorData[3]);

		const int bigTime = atoi(behaviorData[4]);
		const int bigTimeCnt = atoi(behaviorData[5]);

		freeSplit(behaviorData, behaviorDataCnt);

		// char* smData = (char*)malloc(sizeof(char) * (1024 * 1024));

		int userBehaviorReplaceIndex = 0;
		int userBehaviorCnt = 0;
		char** userBehavior = strSplitWithLength(userBehaviorSM, userBehaviorSMLength, LINE_SPLIT_STR, &userBehaviorCnt);
		for(int userBehaviorIndex = 0 ; userBehaviorIndex < userBehaviorCnt ; ++userBehaviorIndex )
		{
			//	0 - ip
			//	1 - user
			//	2 - Small Time
			//	3 - Small Count
			//	4 - Big Time
			//	5 - Big Count
			if( userBehaviorIndex > 0 )
				userBehaviorReplaceIndex += strlen(LINE_SPLIT_STR);
					
			int userBehaviorLength = strlen(userBehavior[userBehaviorIndex]);
			int userBehaviorDataCnt = 0;
			char** userBehaviorData = strSplitWithLength(userBehavior[userBehaviorIndex], userBehaviorLength, DATA_SPLIT_STR, &userBehaviorDataCnt);

			if( strncmp(ip, userBehaviorData[0], strlen(ip)) != 0 ||
				strncmp(user, userBehaviorData[1], strlen(user)) != 0 )
			{		
				userBehaviorReplaceIndex += userBehaviorLength;

				freeSplit(userBehaviorData, userBehaviorDataCnt);
				continue;
			}

			isFindBehavior = true;

			long smSmallTime = atol(userBehaviorData[2]);
			int smSmallCnt = atoi(userBehaviorData[3]);

			long smBigTime = atol(userBehaviorData[4]);
			int smBigCnt = atoi(userBehaviorData[5]);

			freeSplit(userBehaviorData, userBehaviorDataCnt);


			long changeSmallTime = smSmallTime;
			int changeSmallCnt = smSmallCnt;

			long changeBigTime = smBigTime;
			int changeBigCnt = smBigCnt;

			// 현재 시간이 최소 시간보다 크다면
			// 
			if( currentTime > smSmallTime )
			{
				changeSmallTime = currentTime + (smallTime * 60);
				changeSmallCnt = 0;
			}
			// 현재 시간이 최대 시간보다 크다
			if( currentTime > smBigTime )
			{
				changeBigTime = currentTime + (bigTime * 60);
				changeBigCnt = 0;
			}

			if( changeSmallCnt < smallTimeCnt && changeBigCnt < bigTimeCnt )
			{
				result = 1;

				char finalBuf[128] = {'\0', };
				sprintf(finalBuf, "%s%s%s%s%lu%s%d%s%lu%s%d"
					, ip, DATA_SPLIT_STR
					, user, DATA_SPLIT_STR
					, changeSmallTime, DATA_SPLIT_STR
					, changeSmallCnt + 1, DATA_SPLIT_STR
					, changeBigTime, DATA_SPLIT_STR
					, changeBigCnt + 1);

				char* final = replaceIndexWithLength(userBehaviorSM, userBehaviorReplaceIndex, userBehaviorSMLength, userBehavior[userBehaviorIndex], finalBuf);
				if( final )
				{
					writeSharedMemory(userBehaviorSM, final);
					free(final);
				}
			}
			else
			{
				result = 2;

				char buf[128] = {'\0', };
				sprintf(buf, "%d%s%d%s%d%s%d"
					, changeSmallCnt, LOG_DATA_SPLIT_STR
					, smallTimeCnt, LOG_DATA_SPLIT_STR
					, changeBigCnt, LOG_DATA_SPLIT_STR
					, bigTimeCnt);
				dbsAccessLogWithData(eCryptLogMessage_Over_Behavior, buf);
			}

			break;
		}

		// not register user behavior
		if( !isFindBehavior )
		{
			result = 1;

			char buf[128] = {'\0', };
			sprintf(buf, "%s%s%s%s%s%ld%s%d%s%ld%s%d"
				, ( userBehaviorCnt != 0 ) ? LINE_SPLIT_STR : ""
				, ip, DATA_SPLIT_STR
				, user, DATA_SPLIT_STR
				, currentTime + (smallTime * 60), DATA_SPLIT_STR
				, 1, DATA_SPLIT_STR
				, currentTime + (bigTime * 60) , DATA_SPLIT_STR
				, 1);

			strcat(userBehaviorSM, buf);
		}

		freeSplit(userBehavior, userBehaviorCnt);

		break;
	}

	freeSplit(behavior, behaviorCnt);

	if( releaseSharedMemory(behaviorSM) & releaseSharedMemory(userBehaviorSM) )
	{
		if( behaviorCnt == 0 )
			result = 0;

		return result;
	}

	printf("SharedMemory release failed - isPossibleBehavior\n");
	errorLog("SharedMemory release failed - isPossibleBehavior");
	return result;
}
*/

bool getCryptPolicy(const char* user, const char* tableName, const char* columnName, struct CryptionInfo* info)
{
	void* globalCryptSM = getSharedMemory(GLOBAL_POLICY_SHARED_MEMORY_KEY, GLOBAL_POLICY_SHARED_MEMORY_SIZE);
	void* cryptSM = getSharedMemory(CRYPT_POLICY_SHARED_MEMORY_KEY, CRYPT_POLICY_SHARED_MEMORY_SIZE);
	void* keySM = getSharedMemory(KEY_SHARED_MEMORY_KEY, KEY_SHARED_MEMORY_SIZE);

	if( globalCryptSM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Global);
		cryptRelease(globalCryptSM, cryptSM, keySM);
		return false;
	}

	if( cryptSM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Column);
		cryptRelease(globalCryptSM, cryptSM, keySM);
		return false;
	}

	if( keySM == NULL )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Key);
		cryptRelease(globalCryptSM, cryptSM, keySM);
		return false;
	}

	size_t keyLen = strlen(keySM);
	info->key = (char*)calloc(keyLen + 1, sizeof(char));
	memcpy(info->key, keySM, keyLen);


	int globalCryptDataCnt = 0;
	char** globalCryptData = strSplit((const char*)globalCryptSM, DATA_SPLIT_STR, &globalCryptDataCnt);
	if( globalCryptDataCnt < 1 )
	{
		dbsAccessLog(eCryptLogMessage_Not_Register_Global);

		cryptRelease(globalCryptSM, cryptSM, keySM);

		return false;
	}

// Algo Mode
	if( memcmp(globalCryptData[0], "AES", 3) == 0 )
		info->algo = GCRY_CIPHER_AES128;
	else if( memcmp(globalCryptData[0], "SEED", 4) == 0 )
		info->algo = GCRY_CIPHER_SEED;

// Oper Mode
	if( memcmp(globalCryptData[1], "CBC", 3) == 0 )
		info->mode = GCRY_CIPHER_MODE_CBC;
	else if( memcmp(globalCryptData[1], "ECB", 3) == 0 )
		info->mode = GCRY_CIPHER_MODE_ECB;

	freeSplit(globalCryptData, globalCryptDataCnt);

//

//0 - OWNER
//1 - TABLE_NAME
//2 - COLUMN_NAME
//3 - HASH_CHECK ( Y / N )
//4 - HASH_SALT
//5 - IV_CHECK ( Y / N )
//6 - IV_VALUE
//7 - PARTIAL_ENCRYPT_CHECK
//8 - PARTIAL_ENCRYPT_LENGTH
//9 - MASK_CHECK ( Y / N )
//10 - MASK_DIGIT
//11 - MASK_VALUE
//12 - SYSTEM_APPLY_DATE

//
	// size_t userLen = strlen(user);
	// size_t tableNameLen = strlen(tableName);
	// size_t columnNameLen = strlen(columnName);


	bool isFindPolicy = false;

	int rowDataCnt = 0;
	char** rowData = strSplit((char*)cryptSM, LINE_SPLIT_STR, &rowDataCnt);
	for(int i = 0 ; i < rowDataCnt ; ++i)
	{
		int dataCnt = 0;
		char** data = strSplit(rowData[i], DATA_SPLIT_STR, &dataCnt);

		if( data[0] == NULL || data[1] == NULL || data[2] == NULL )
			continue;

		if( strcmp(user, data[0]) != 0 
			|| strcmp(tableName, data[1]) != 0 
			|| strcmp(columnName, data[2]) != 0 )
		{
			freeSplit(data, dataCnt);
			continue;
		}

		// Normal Length
		if( data[7] != NULL && memcmp(data[7], "Y", 1) == 0 )
		{
			info->normalLength = atoi(data[8]);
		}
		// Masking
		if( data[9] != NULL && memcmp(data[9], "Y", 1) == 0 )
		{
			size_t maskSectionLen = strlen(data[10]);
			info->maskSection = (char*)calloc(maskSectionLen + 1, sizeof(char));
			memcpy(info->maskSection, data[10], maskSectionLen);

			info->mask = data[11][0];
		}

		isFindPolicy = true;
		// HASH
		if( data[3] != NULL && memcmp(data[3], "Y", 1) == 0 )
		{
			info->algo = GCRY_MD_SHA256;
			info->mode = GCRY_CIPHER_MODE_NONE;

			int ivOrSaltLen = strlen(data[4]);
			info->ivOrSalt = (char*)calloc(ivOrSaltLen +1, sizeof(char));
			memcpy(info->ivOrSalt, data[4], ivOrSaltLen);
			// freeSplit(data, dataCnt);
			// break;
		}
		// IV
		else if( data[5] != NULL && memcmp(data[5], "Y", 1) == 0 )
		{
			// if( data[6] == NULL || strlen(data[6]) <= 0 )
			// 	continue;

			int ivOrSaltLen = strlen(data[6]);
			//size_t ivOrSaltLen = strlen(data[6]) + 1;
			info->ivOrSalt = (char*)calloc(ivOrSaltLen, sizeof(char));
			memcpy(info->ivOrSalt, data[6], ivOrSaltLen);

			// freeSplit(data, dataCnt);
			// break;
		}

		freeSplit(data, dataCnt);
		break;
	}

	freeSplit(rowData, rowDataCnt);
	cryptRelease(globalCryptSM, cryptSM, keySM);

	if( !isFindPolicy )
	{
		info->algo = GCRY_CIPHER_NONE;
		info->mode = GCRY_CIPHER_MODE_NONE;
		
		return false;
	}

	return true;
}

unsigned char* getRNG(size_t length)
{
	unsigned char* rng = (unsigned char*)calloc(128, sizeof(unsigned char));
	gcry_randomize(rng, length, GCRY_STRONG_RANDOM);
	return rng;

	char rng1[18];
	gcry_randomize(rng1, sizeof(rng1), GCRY_STRONG_RANDOM);
	for(int i = 0 ; i < 18 ; ++i)
		printf("%02X ", (unsigned char)rng1[i]);
	#ifdef DEBUG_MODE
	printf("rng1 : %s, %u\n\n", rng1, strlen(rng1));
	#endif

	char rng2[16];
	gcry_create_nonce(rng2, sizeof(rng2));
	for(int i = 0 ; i < 16 ; ++i)
		printf("%02X ", (unsigned char)rng2[i]);
	#ifdef DEBUG_MODE
	printf("rng2 : %s, %u\n\n", rng2, strlen(rng2));
	#endif
}

char* plainToHex(const char* plain)
{
	static char hexs[256] = {'\0', };
	memset(hexs, '\0', sizeof(hexs));

	size_t plainLen = strlen(plain);
	for(int i = 0; i < plainLen ; ++i)
	{
		sprintf(hexs + (i * 2), "%02X", plain[i]);
	}

	return hexs;
}

char* hexToStr(unsigned char hex)
{
	char* buf = (char*)calloc(2, sizeof(char));
	sprintf(buf, "%02X", hex);
	return buf;
}

char* hexsToStrWithRange(unsigned char* hexs, size_t start, size_t end)
{
	// char* str = (char*)malloc(sizeof(char) * (hexsLen + 1));
	char* str = (char*)calloc(end * 2 + 1, sizeof(char));

	if( start != 0 )
		memcpy(str, hexs, start);

	for(int i = 0 ; i < end - start; ++i)
	{
		sprintf((str + start) + (i * 2), "%02X", hexs[i + start]);

		// char* hex = hexToStr(hexs[i + start]);
		// strncpy((str + start) + (i*2), hex, 2);
		// free(hex);
	}

	return str;
}

char* hexsToStrWithLength(unsigned char* hexs, size_t length)
{
	size_t size = length;
	if( length == 0 )
		size = strlen((char*)hexs);

	return hexsToStrWithRange(hexs, 0, size);
}

char* hexsToStr(unsigned char* hexs)
{
	return hexsToStrWithLength(hexs, 0);
}

unsigned char strToHex(const char* str)
{
	unsigned char hex = 0;
	for(int i = 0 ; i < 2 ; ++i)
	{
		if( str[i] >= '0' && str[i] <= '9' )
			hex += str[i] - '0';
		else if( str[i] >= 'A' && str[i] <= 'F' )
			hex += str[i] - 'A' + 10;
		else if( str[i] >= 'a' && str[i] <= 'f' )
			hex += str[i] - 'a' + 10;
		
		if( i == 0 )
			hex <<= 4;
	}
	
	return hex;
}

unsigned char* strToHexsWithRange(const char* str, size_t start, size_t end)
{
	unsigned char* hexs = (unsigned char*)calloc(end + 1, sizeof(unsigned char));

	if( start != 0 )
		memcpy(hexs, str, start);

	for(int i = 0 ; i < (end - start) / 2 ; ++i)
	{
		int index = i * 2;
		char buf[2] = {str[index + start], str[index + start + 1]};
		unsigned char hex = strToHex(buf);
		memcpy(&hexs[i + start], &hex, 1);
	}

	return hexs;
}

unsigned char* strToHexsWithLength(const char* str, size_t length)
{
	size_t size = length;
	if( length == 0 )
		size = strlen(str);

	return strToHexsWithRange(str, 0, size);
}

unsigned char* strToHexs(const char* str)
{
	return strToHexsWithLength(str, 0);
}
