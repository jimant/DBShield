/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __JAEYUN_LIBS_H__
#define __JAEYUN_LIBS_H__

#include "fo4sCommon.h"
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

char** strSplit(const char* data, const char* delimiter, int* cnt);
char** strSplitWithLength(const char* data, size_t length, const char* delimiter, int* cnt);

void freeSplit(char** data, int cnt);

int allStrLen(char** str, int cnt);

char* appendStr(char* src, char* dst);
char* replaceAll(char* s, const char* olds, const char* news);
char* replaceAllWithLength(char* s, size_t length, const char* olds, const char* news);
char* replaceIndex(char* s, size_t index, const char* olds, const char* news);
char* replaceIndexWithLength(char* s, size_t index, size_t length, const char* olds, const char* news);

void makeDirectory(char *full_path);

struct tm* getTime();
char* getCurrentDay();
char* getCurrentTime();

#ifdef __cplusplus
}
#endif

#endif
