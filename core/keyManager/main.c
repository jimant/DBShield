/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "keyManager.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char* argv[])
{
	char buf[32] = {'\0', };
	printf("Data : ");
	scanf("%s", buf);
	for( int i = 0 ; i < 4 ; ++i )
	{
		char oldKEK[512] = {'\0', };
		char oldEK[512] = {'\0', };
		char newKEK[512] = {'\0', };
		char newEK[512] = {'\0', };

		char* tmpOldKEK = generateKeyEncryptKey(buf);
		memcpy(oldKEK, tmpOldKEK, strlen(tmpOldKEK));
		char* tmpOldEK = generateEncryptKey(buf, oldKEK);
		memcpy(oldEK, tmpOldEK, strlen(tmpOldEK));

		char* tmpNewKEK = generateKeyEncryptKey(buf);
		memcpy(newKEK, tmpNewKEK, strlen(tmpNewKEK));
		char* tmpNewEK = regenerateEncryptKey(oldEK, oldKEK, newKEK);
		memcpy(newEK, tmpNewEK, strlen(tmpNewEK));

		printf("%d --\nKEK %ld: %s\nECK %ld: %s\n\nNEW KEK %ld: %s\nNEW ECK %ld: %s\n\n", i, 
			strlen(oldKEK), oldKEK,
			strlen(oldEK), oldEK,
			strlen(newKEK), newKEK,
			strlen(newEK), newEK);

		free(tmpNewEK);
		free(tmpNewKEK);
		free(tmpOldEK);
		free(tmpOldKEK);
	}

	return 0;
}
