/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "logManager.h"
#include "../fo4sLibs/fo4sLibs.h"
#include "../sharedMemory/sharedMemory.h"

#include <stdio.h>
#include <time.h>
#include <stdarg.h>

#include <unistd.h>
#include <string.h>
#include <sys/stat.h>

#include <stdbool.h>
#include <stddef.h>

#include <stdlib.h>

#include <syslog.h>

char 			LOG_THREAD_ID[64] = {'\0', };
eCRYPT_LOG_TYPE 	LOG_TYPE = eCryptLogType_NONE;
char 			LOG_ACCESS_IP[16] = {'\0', };
char 			LOG_ACCESS_USER[32] = {'\0', };
char 			LOG_PROGRAM_NAME[32] = {'\0', };

char			LOG_UNIQUE_ID[64] = {'\0', };

size_t		LOG_THREAD_ID_LENGTH = 0;
size_t		LOG_TYPE_LENGTH = 0;
size_t		LOG_ACCESS_IP_LENGTH = 0;
size_t		LOG_ACCESS_USER_LENGTH = 0;
size_t		LOG_PROGRAM_NAME_LENGTH = 0;
size_t		LOG_UNIQUE_ID_LENGTH = 0;

static	bool* 	IS_SUCCESS = NULL;

void initSimpleLog(eCRYPT_LOG_TYPE logType)
{
	setCryptLogThreadID("SYSLOG");
	setCryptLogType(logType);
}

void initLog(const char* threadID, eCRYPT_LOG_TYPE logType
	, const char* accessIP, const char* accessUser
	, const char* programName
	, bool* isSuccess)
{
	setCryptLogThreadID(threadID);
	setCryptLogType(logType);
	setCryptLogAccessIP(accessIP);
	setCryptLogAccessUser(accessUser);
	setCryptLogProgramName(programName);

	if( isSuccess )
		IS_SUCCESS = isSuccess;
}

void setCryptLogThreadID(const char* threadID)
{
	if( threadID != NULL )
	{
		LOG_THREAD_ID_LENGTH = strlen(threadID);
		memcpy(LOG_THREAD_ID, threadID, LOG_THREAD_ID_LENGTH);
	}
}

const char* getCryptLogThreadID()
{
	return LOG_THREAD_ID;
}

void setCryptLogType(eCRYPT_LOG_TYPE type)
{
	LOG_TYPE_LENGTH = 1;
	memcpy(&LOG_TYPE, &type, LOG_TYPE_LENGTH);
}

eCRYPT_LOG_TYPE getCryptLogType()
{
	return LOG_TYPE;
}

void setCryptLogAccessIP(const char* accessIP)
{
	if( accessIP != NULL )
	{
		LOG_ACCESS_IP_LENGTH = strlen(accessIP);
		memcpy(LOG_ACCESS_IP, accessIP, LOG_ACCESS_IP_LENGTH);
	}
}

const char* getCryptLogAccessIP()
{
	return LOG_ACCESS_IP;
}

void setCryptLogAccessUser(const char* accessUser)
{
	if( accessUser != NULL )
	{
		LOG_ACCESS_USER_LENGTH = strlen(accessUser);
		memcpy(LOG_ACCESS_USER, accessUser, LOG_ACCESS_USER_LENGTH);
	}
}

const char* getCryptLogAccessUser()
{
	return LOG_ACCESS_USER;
}

void setCryptLogProgramName(const char* programName)
{
	if( programName != NULL )
	{
		LOG_PROGRAM_NAME_LENGTH = strlen(programName);
		memcpy(LOG_PROGRAM_NAME, programName, LOG_PROGRAM_NAME_LENGTH);
	}
}

const char* getCryptLogProgramName()
{
	return LOG_PROGRAM_NAME;
}

bool openLogFile()
{
	openlog("dbs", LOG_PID | LOG_CONS, LOG_USER);

	if( LOG_TYPE == eCryptLogType_NONE || LOG_THREAD_ID == NULL ) {
		char logBuf[32] = {'\0', };
		sprintf(logBuf, "SYSLOG: Log file open failed");
		syslog(LOG_ERR, logBuf);
		closelog();
		return false;
	}

	return true;
}

bool closeLogFile()
{
	closelog();

	return true;
}

void createLogData(const char* message)
{
	/**
	 *		LOG_UNIQUE_ID
	 *		LOG_TYPE
	 *		LOG_ACCESS_IP
	 *		LOG_ACCESS_USER
	 *		LOG_PROGRAM_NAME
	 */
	// char* logData = (char*)calloc(256, sizeof(char));
	// sprintf(logData, "%s : %s - %s")
}

void writeEncDecLog(int syslogType, eCRYPT_LOG_MESSAGE logMessage, void* data)
{
	if( IS_SUCCESS )
	{
		if( logMessage == eCryptLogMessage_Allow )
			*IS_SUCCESS = true;
		else
			*IS_SUCCESS = false;
	}

	void* logSM = getSharedMemory(LOG_SHARED_MEMORY_KEY, LOG_SHARED_MEMORY_SIZE);

	if( logSM == NULL )
		logSM = createSharedMemory(LOG_SHARED_MEMORY_KEY, LOG_SHARED_MEMORY_SIZE);

	char dbsLogBuf[256] = {'\0', };

	size_t logSMLength = strlen((char*)logSM);

	bool isFind = false;

	int dbsLogReplaceIndex = 0;
	int dbsLogCnt = 0;
	char** dbsLog = strSplitWithLength(logSM, logSMLength, LINE_SPLIT_STR, &dbsLogCnt);
	for(int i = 0 ; i < dbsLogCnt ; ++i)
	{
		if( i > 0 )
			dbsLogReplaceIndex += strlen(LINE_SPLIT_STR);

		int logDataCnt = 0;
		int logDataLength = strlen(dbsLog[i]);
		char** logData = strSplitWithLength(dbsLog[i], logDataLength, LOG_SPLIT_STR, &logDataCnt);

		char* smLogThreadID = logData[1];
		int smLogType = atoi(logData[2]);
		char* smLogAccessIP = logData[3];
		char* smLogAccessUser = logData[4];
		char* smLogProgramName = logData[5];

		int smLogMessage = atoi(logData[6]);

		int smLogCnt = atoi(logData[7]);

		if( memcmp(LOG_THREAD_ID, smLogThreadID, LOG_THREAD_ID_LENGTH) != 0 ||
			LOG_TYPE != smLogType ||
			memcmp(LOG_ACCESS_IP, smLogAccessIP, LOG_ACCESS_IP_LENGTH) != 0 ||
			memcmp(LOG_ACCESS_USER, smLogAccessUser, LOG_ACCESS_USER_LENGTH) != 0 ||
			memcmp(LOG_PROGRAM_NAME, smLogProgramName, LOG_PROGRAM_NAME_LENGTH) != 0 ||
			smLogMessage != logMessage )
		{
			dbsLogReplaceIndex += logDataLength;

			freeSplit(logData, logDataCnt);
			continue;
		}
		else
		{
			if( smLogMessage == eCryptLogMessage_Over_Behavior && strcmp((char*)data, logData[8]) != 0 )
			{
				dbsLogReplaceIndex += logDataLength;

				freeSplit(logData, logDataCnt);
				continue;
			}
		}

		isFind = true;

		sprintf(dbsLogBuf, "%d%s%s%s%d%s%s%s%s%s%s%s%d%s%d"
			, syslogType, LOG_SPLIT_STR
			, LOG_THREAD_ID, LOG_SPLIT_STR
			, LOG_TYPE, LOG_SPLIT_STR
			, LOG_ACCESS_IP, LOG_SPLIT_STR
			, LOG_ACCESS_USER, LOG_SPLIT_STR
			, LOG_PROGRAM_NAME, LOG_SPLIT_STR
			, logMessage, LOG_SPLIT_STR
			, smLogCnt + 1);

		if( logMessage == eCryptLogMessage_Over_Behavior )
		{
			char dataBuf[64] = {'\0', };
			sprintf(dataBuf, "%s%s", LOG_SPLIT_STR, (char*)data);
			strcat(dbsLogBuf, dataBuf);
		}

		char* dbsFinalLog = replaceIndexWithLength(logSM, dbsLogReplaceIndex, logSMLength, dbsLog[i], dbsLogBuf);

		writeSharedMemory(logSM, dbsFinalLog);

		free(dbsFinalLog);

		freeSplit(logData, logDataCnt);
		break;
	}
	freeSplit(dbsLog, dbsLogCnt);

	if( !isFind )
	{
		sprintf(dbsLogBuf, "%s%d%s%s%s%d%s%s%s%s%s%s%s%d%s%d"
			, ( dbsLogCnt > 0 ) ? LINE_SPLIT_STR : ""
			, syslogType, LOG_SPLIT_STR
			, LOG_THREAD_ID, LOG_SPLIT_STR
			, LOG_TYPE, LOG_SPLIT_STR
			, LOG_ACCESS_IP, LOG_SPLIT_STR
			, LOG_ACCESS_USER, LOG_SPLIT_STR
			, LOG_PROGRAM_NAME, LOG_SPLIT_STR
			, logMessage, LOG_SPLIT_STR
			, 1);

		if( logMessage == eCryptLogMessage_Over_Behavior )
		{
			char dataBuf[64] = {'\0', };
			sprintf(dataBuf, "|%s", (char*)data);
			strcat(dbsLogBuf, dataBuf);
		}

		strcat(logSM, dbsLogBuf);
	}

	releaseSharedMemory(logSM);
}

void errorLog(const char* message)
{
	if( openLogFile() )
	{
		char logBuf[256] = {'\0', };
		sprintf(logBuf, "SYSLOG: %s", message);
		syslog(LOG_ERR, logBuf);
		closeLogFile();
	}
}

void denyLog(const char* message)
{
	if( openLogFile() )
	{
		// writeEncDecLog(LOG_INFO, false, message);

		closeLogFile();
	}
}

void allowLog(const char* message)
{
	if( openLogFile() )
	{
		closeLogFile();
	}
}

void dbsAccessLog(eCRYPT_LOG_MESSAGE message)
{
	char logBuf[256] = {'\0', };
        char convertCryptLogType[8] = {'\0', };
        char convertMessage[43] = {'\0', };

        switch(LOG_TYPE)
        {
               case eCryptLogType_Encrypt:
                    strncpy(convertCryptLogType, "Encrypt",7);
                    break;

               case eCryptLogType_Decrypt:
                    strncpy(convertCryptLogType, "Decrypt",7);
                    break;

               default:
                   strncpy(convertCryptLogType, "Invalid",7);
                   break;
	}


        switch(message)
	{
		case eCryptLogMessage_Allow:
                	strncpy(convertMessage, "allow", 5);
			break;
        	case eCryptLogMessage_Fail_Handle_Open:
                	strncpy(convertMessage, "crypt handle open failed",24);
			break;
        	case eCryptLogMessage_Fail_Encrypt:
               		strncpy(convertMessage, "encrypt fail",12);
			break;
        	case eCryptLogMessage_Fail_Decrypt:
                	strncpy(convertMessage, "decrypt fail",12);
			break;
       	 	case eCryptLogMessage_Not_Register_Global:
                	strncpy(convertMessage, "not register crypt globa",25);
			break;
        	case eCryptLogMessage_Not_Register_Column:
                	strncpy(convertMessage, "not register crypt column",25);
			break;
        	case eCryptLogMessage_Not_Register_Key:
                	strncpy(convertMessage, "not register crypt key",22);
			break;
        	case eCryptLogMessage_Not_Register_Behavior:
                	strncpy(convertMessage, "not register behavior",21);
			break;
        	case eCryptLogMessage_Not_Register_Policy:
                	strncpy(convertMessage, "not register policy",20);
			break;
        	case eCryptLogMessage_Not_Possible_Crypt:
                	strncpy(convertMessage, "not possible crypt",18);
			break;
       	 	case eCryptLogMessage_Null_Data:
                	strncpy(convertMessage, "data is null",12);
			break;
       	 	case eCryptLogMessage_Null_IP:
                	strncpy(convertMessage, "ip is null",10);
			break;
        	case eCryptLogMessage_Null_User:
                	strncpy(convertMessage, "user is null",12);
			break;
            	case eCryptLogMessage_Invalid_Option:
                    	strncpy(convertMessage, "invalid option algorithm: NONE, mode: NONE",42);
			break;
            	case eCryptLogMessage_Invalid_Option_None_Algorithm:
                     	strncpy(convertMessage, "invalid option algorithm: NONE",30);
			break;
            	case eCryptLogMessage_Invalid_Option_None_Mode:
                     	strncpy(convertMessage, "invalid option mode: NONE",25);
			break;
            	case eCryptLogMessage_Invalid_Option_Encrypt:
                   	strncpy(convertMessage, "invalid option encrypt",22);
			break;
            	case eCryptLogMessage_Invalid_Option_Decrypt:
                    	strncpy(convertMessage, "invalid option decrypt",22);
			break;
            	case eCryptLogMessage_Over_Normal_To_Data:
                    	strncpy(convertMessage, "normal length > data length",27);
			break;
            	case eCryptLogMessage_Over_Behavior:
                   	strncpy(convertMessage, "Behavior undefine yet",21);
                   	break;
                default:
                   strncpy(convertMessage, "Invalid",7);
                   break;
        }

	if( openLogFile() )
	{
		sprintf(logBuf, "%s|%s|%s|%s|%s|%s|%s"
			, LOG_THREAD_ID
			, convertCryptLogType
			, LOG_ACCESS_IP
			, LOG_ACCESS_USER
			, LOG_PROGRAM_NAME
			, (message == eCryptLogMessage_Allow) ? "ALLOW" : "DENY"
			, convertMessage);

		syslog(LOG_INFO, logBuf);
		closeLogFile();
	}
}

char* readCryptLogMessageWithData(eCRYPT_LOG_MESSAGE message, void* data)
{
	char* logMessage = (char*)calloc(256, sizeof(char));
	if( message == eCryptLogMessage_Allow )
	{
		strcpy(logMessage, "allow");
	}
	if( message == eCryptLogMessage_Fail_Handle_Open )
	{
		strcpy(logMessage, "crypt handle open failed");
	}
	
	if( message == eCryptLogMessage_Fail_Encrypt )
		strcpy(logMessage, "encrypt fail");
	if( message == eCryptLogMessage_Fail_Decrypt )
		strcpy(logMessage, "decrypt fail");

	if( message == eCryptLogMessage_Not_Register_Global )
		strcpy(logMessage, "not register crypt global");
	if( message == eCryptLogMessage_Not_Register_Column )
		strcpy(logMessage, "not register crypt column");
	if( message == eCryptLogMessage_Not_Register_Key )
		strcpy(logMessage, "not register crypt key");
	if( message == eCryptLogMessage_Not_Register_Behavior )
		strcpy(logMessage, "not register behavior");
	if( message == eCryptLogMessage_Not_Register_Policy )
		strcpy(logMessage, "not register policy");

	if( message == eCryptLogMessage_Not_Possible_Crypt )
		strcpy(logMessage, "not possible crypt");

	if( message == eCryptLogMessage_Null_Data )
		strcpy(logMessage, "data is null");
	if( message == eCryptLogMessage_Null_IP )
		strcpy(logMessage, "ip is null");
	if( message == eCryptLogMessage_Null_User )
		strcpy(logMessage, "user is null");

	if( message == eCryptLogMessage_Invalid_Option )
		strcpy(logMessage, "invalid option algorithm: NONE, mode: NONE");
	if( message == eCryptLogMessage_Invalid_Option_None_Algorithm )
		strcpy(logMessage, "invalid option algorithm: NONE");
	if( message == eCryptLogMessage_Invalid_Option_None_Mode )
		strcpy(logMessage, "invalid option mode: NONE");
	if( message == eCryptLogMessage_Invalid_Option_Encrypt )
		strcpy(logMessage, "invalid option encrypt");
	if( message == eCryptLogMessage_Invalid_Option_Decrypt )
		strcpy(logMessage, "invalid option decrypt");

	if( message == eCryptLogMessage_Over_Normal_To_Data )
		strcpy(logMessage, "normal length > data length");
	if( message == eCryptLogMessage_Over_Behavior )
	{
		int splitDataCnt = 0;
		char** splitData = strSplit((char*)data, LOG_DATA_SPLIT_STR, &splitDataCnt);
		// sprintf(logMessage, "behavior over [ \"%s\" - \"%s\" ] - small time : %ld, small count : ( %d / %d ), big time : %ld, big count : ( %d / %d )"
		// 	, splitData[0], splitData[1], splitData[2], splitData[3], splitData[4], splitData[5], splitData[6], splitData[7]);
		sprintf(logMessage, "behavior over [ \"%s\" - \"%s\" ] - small count : ( %s / %s ), big count : ( %s / %s )"
			, splitData[0], splitData[1], splitData[2], splitData[3], splitData[4], splitData[5]);
		freeSplit(splitData, splitDataCnt);
	}

	return logMessage;
}
