/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include <stdio.h>

#include "logManager.h"
#include "../sharedMemory/sharedMemory.h"

#include <time.h>

int main(int argc, const char* argv[])
{
	clock_t start, finish;
	initLog("4444", eCryptLogType_Encrypt, "127.0.0.1", "goodocy", NULL);

	start = clock();
	for(int i = 0 ; i < 1 ; ++i)
	{
		printf("%d\n", i);
		errorLog("Error!!");
	}
	finish = clock();

	return 0;
}
