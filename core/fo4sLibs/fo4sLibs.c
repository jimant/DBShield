/*
  *
  * Copyright (C) 2015 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "fo4sLibs.h"

#include <stdio.h>

#include <stdlib.h>
#include <string.h>

#include <stdarg.h>

#include <unistd.h>
#include <sys/stat.h>

char** strSplit(const char* data, const char* delimiter, int* cnt)
{
    if( data == NULL || delimiter == NULL )
        return NULL;

    size_t dataLength = strlen(data);

    return strSplitWithLength(data, dataLength, delimiter, cnt);
}

char** strSplitWithLength(const char* data, size_t length, const char* delimiter, int* cnt)
{
    if( data == NULL || length == 0 || delimiter == NULL )
        return NULL;

    size_t dataLength = length;
    size_t delimiterLength = strlen(delimiter);

    if( delimiterLength == 0 )
        return NULL;

    size_t dataCnt = (dataLength / (delimiterLength + 1)) + 1;
    
    char** result = (char**)calloc(dataCnt, sizeof(char*));
    
    const char* tempData = data;
    int resultLength = 0;

    int resultDataLength = 0;

    char* tempResult = (char*)calloc(dataLength, sizeof(char));
    char* checkData = (char*)calloc(delimiterLength + 1, sizeof(char));
    while( *tempData != '\0' )
    {
        // delimiter check
        if( tempData[0] == delimiter[0] )
        {
            memset(checkData, '\0', delimiterLength + 1);
    
            for(int i = 0 ; i < delimiterLength ; ++i)
            {
                if( tempData[i] == '\0' )
                    break;

                checkData[i] = tempData[i];
            }

            if ( strcmp(checkData, delimiter) == 0 )
            {
                result[resultLength] = (char*)calloc(resultDataLength + 1, sizeof(char));
                memcpy(result[resultLength], tempResult, resultDataLength);

                ++resultLength;

                tempData += delimiterLength;

                resultDataLength = 0;
                memset(tempResult, '\0', dataLength);
            }
            else
            {
                tempResult[resultDataLength++] = tempData[0];
                ++tempData;
            }
            continue;
        }

        tempResult[resultDataLength++] = tempData[0];
        ++tempData;
    }

    result[resultLength] = (char*)calloc(resultDataLength + 1, sizeof(char));
    memcpy(result[resultLength], tempResult, resultDataLength);

    free(checkData);
    free(tempResult);

    ++resultLength;
    if( dataCnt != resultLength )
    {
        //fo4s review
        result = (char**)realloc(result, sizeof(char*) * resultLength);
    }

    if( cnt != NULL )
        *cnt = resultLength;   

    return result;
}
// not used function
char** strSplitWithLengthForDataLength(const char* data, size_t length, const char* delimiter, int* cnt, int** dataLengthArray)
{
    if( data == NULL || length == 0 || delimiter == NULL )
        return NULL;

    size_t dataLength = length;
    size_t delimiterLength = strlen(delimiter);

    if( delimiterLength == 0 )
        return NULL;

    size_t dataCnt = (dataLength / (delimiterLength + 1)) + 1;
    
    char** result = (char**)calloc(dataCnt, sizeof(char*));
    
    const char* tempData = data;
    int resultLength = 0;

    int resultDataLength = 0;

    char* tempResult = (char*)calloc(dataLength, sizeof(char));
    char* checkData = (char*)calloc(delimiterLength + 1, sizeof(char));
    while( *tempData != '\0' )
    {
        // delimiter check
        if( tempData[0] == delimiter[0] )
        {
            memset(checkData, '\0', delimiterLength + 1);
    
            for(int i = 0 ; i < delimiterLength ; ++i)
            {
                if( tempData[i] == '\0' )
                    break;

                checkData[i] = tempData[i];
            }

            if ( strcmp(checkData, delimiter) == 0 )
            {
                result[resultLength] = (char*)calloc(resultDataLength + 1, sizeof(char));
                memcpy(result[resultLength], tempResult, resultDataLength);

                ++resultLength;

                tempData += delimiterLength;

                resultDataLength = 0;
                memset(tempResult, '\0', dataLength);
            }
            else
            {
                tempResult[resultDataLength++] = tempData[0];
                ++tempData;
            }
            continue;
        }

        tempResult[resultDataLength++] = tempData[0];
        ++tempData;
    }

    result[resultLength] = (char*)calloc(resultDataLength + 1, sizeof(char));
    memcpy(result[resultLength], tempResult, resultDataLength);

    free(checkData);
    free(tempResult);

    ++resultLength;
    if( dataCnt != resultLength )
    {
        //fo4s review
        result = (char**)realloc(result, sizeof(char*) * resultLength);
    }

    if( cnt != NULL )
        *cnt = resultLength;   

    return result;
}

void freeSplit(char** data, int cnt)
{
    if( data == NULL )
        return;

    for(int i = 0 ; i < cnt ; ++i)
    {
        free(data[i]);
        data[i] = NULL;
    }

    free(data);
    data = NULL;
}

// not used function
int allStrLen(char** str, int cnt)
{
    if( str == NULL || cnt == 0 )
        return 0;

    size_t length = 0;
    for(int i = 0 ; i < cnt ; ++i)
        length += strlen(str[i]);

    return length;
}

char* appendStr(char* src, char* dst)
{
    if( src == NULL || dst == NULL )
        return NULL;

    size_t srcLen = strlen(src);
    size_t dstLen = strlen(dst);
    if( srcLen < 1 || dstLen < 1 )
        return NULL;

    char* result = (char*)calloc(srcLen + dstLen + 1, sizeof(char));
    if( result == NULL )
        return NULL;

    memcpy(result, src, srcLen);
    memcpy(result + srcLen, dst, dstLen);

    return result;
}

// not used function
char* replaceAll(char* s, const char* olds, const char* news)
{
    return replaceIndex(s, 0, olds, news);
}

char* replaceAllWithLength(char* s, size_t length, const char* olds, const char* news)
{
    return replaceIndexWithLength(s, 0, length, olds, news);
}

// not used
char* replaceIndex(char* s, size_t index, const char* olds, const char* news)
{
    int length = strlen(s);
    return replaceIndexWithLength(s, index, length, olds, news);
}

char* replaceIndexWithLength(char* s, size_t index, size_t length, const char* olds, const char* news)
{
    char* result = NULL;
    char* sr = NULL;
    size_t i, count = 0;
    size_t oldlen = strlen(olds);

    size_t slen = length;
    if( oldlen < 1 )
    {
        result = (char*)calloc(slen, sizeof(s));
        memcpy(result, s, slen);
        return result;
    }

    size_t newlen = strlen(news);


    if (newlen != oldlen)
    {
        for (i = 0; s[i] != '\0';)
        {
            if (memcmp(&s[i], olds, oldlen) == 0)
                count++, i += oldlen;
            else
                i++;
        }
    }
    else
        i = slen;

    result = (char *) calloc(i + 1 + count * (newlen - oldlen), sizeof(char));
    if (result == NULL)
        return NULL;

    sr = result;

    memcpy(sr, s, index);
    s += index;

    if( memcmp(s, olds, oldlen) == 0 )
    {
        memcpy(sr + index, news, newlen);
        memcpy(sr + index + newlen, s + oldlen, length - (index + oldlen));

        // strcat(sr, news);
        // strcat(sr, s + index + newlen);
    }
    else
    {
        while (*s)
        {
            if (memcmp(s, olds, oldlen) == 0)
            {
                memcpy(sr, news, newlen);
                sr += newlen;
                s  += oldlen;
            } 
            else
                *sr++ = *s++;
        }
        *sr = '\0';
    }


    return result;
}

void makeDirectory(char *full_path)
{
    char temp[256], *sp;

    strcpy(temp, full_path);
    sp = temp;

    // 디렉토리 구분자를 찾았으면
    while((sp = strchr(sp, '/')))
    {
        // 루트디렉토리가 아니면
        if(sp > temp && *(sp - 1) != ':')
        {
            *sp = '\0'; // 잠시 문자열 끝으로 설정
            mkdir(temp, S_IFDIR | S_IRWXU | S_IRWXG | S_IXOTH | S_IROTH);
            // 디렉토리를 만들고 (존재하지 않을 때)
            *sp = '/'; // 문자열을 원래대로 복귀
        }
    sp++; // 포인터를 다음 문자로 이동
    }
}

struct tm* getTime()
{
    struct tm* t;
    time_t timer;
    timer = time(NULL);
    t = localtime(&timer);

    return t;
}

char* getCurrentDay()
{
    struct tm* t = getTime();

    static char curDay[11] = {'\0', };
    sprintf(curDay, "%04d-%02d-%02d",
        t->tm_year + 1900, t->tm_mon + 1, t->tm_mday);
    return curDay;  
}

char* getCurrentTime()
{
    struct tm* t = getTime();

    static char curTime[20] = {'\0', };
    sprintf(curTime, "%04d-%02d-%02d %02d:%02d:%02d",
        t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
        t->tm_hour, t->tm_min, t->tm_sec);
    return curTime;
}
