/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __COMMON_H__
#define __COMMON_H__

#include "sharedMemory/sharedMemory.h"
#include "fo4sLibs/fo4sLibs.h"
#include "logManager/logManager.h"

#include <time.h>
#define INIT_CLOCK \
	clock_t start, finish; \
	double elapsed;

#define START_CLOCK \
    start = clock();

#define END_CLOCK(__MSG__) \
    finish = clock(); \
    elapsed = (double)(finish - start) / CLOCKS_PER_SEC; \
    printf("%s - Running Time : %.6f\n\n", __MSG__, elapsed);

#define MAX_TEST	20000

#define TEST_START \
    START_CLOCK \
    for(int __TEST_INDEX__ = 0 ; __TEST_INDEX__ < MAX_TEST ; ++__TEST_INDEX__) { \

#define TEST_END(__MSG__) \
    } \
    END_CLOCK(__MSG__)

struct DBInfo{
	char* 	ip;
	char* 	user;
	char* 	passwd;
	int 	port;
	char* 	dbName;
	char* 	tableName;
};

static inline void initDBInfo(struct DBInfo info)
{
	info.ip = NULL;
	info.user = NULL;
	info.passwd = NULL;
	info.port = -1;
	info.dbName = NULL;
	info.tableName = NULL;
}

#endif
