/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../../core/cryption/encryption.h"
#include "../../../core/cryption/decryption.h"
#include "../../../core/cryption/cryptCommon.h"

char* encryptionOracle(char* ip, char* user, char* threadID, char* programName, char* data, char* dbName, char* tableName, char* columnName)
{
	 char convIP[32] = {'\0', };
	 if( strcmp(ip, "localhost") == 0 )
	   strcpy(convIP, "127.0.0.1");
	 else
	   strcpy(convIP, ip);

	bool isSuccess;
	char* result = encryption(convIP, user, threadID, programName, data, dbName, tableName, columnName, &isSuccess);
        if (!isSuccess) {
		sprintf(result, "ERROR-FO4S-0001");	
	}
	return result;
}

char* decryptionOracle(char* ip, char* user, char* threadID, char* programName, char* data, char* dbName, char* tableName, char* columnName)
{
	 char convIP[32] = {'\0', };
	 if( strcmp(ip, "localhost") == 0 )
	   strcpy(convIP, "127.0.0.1");
	 else
	   strcpy(convIP, ip);

	bool isSuccess;
	char* result = decryption(convIP, user, threadID, programName, data, dbName, tableName, columnName, &isSuccess);
	/* added by bsw sprintf() */
        if (!isSuccess) {
		sprintf(result, "ERROR-FO4S-0002");	
	}
    return result;
}


