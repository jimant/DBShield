/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <unistd.h>

#include <mysql/mysql.h>

#include "approachCommon.h"

#include <jimant/cryption/cryptUtils.h>
#include <jimant/cryption/decryption.h>

void help()
{
    printf("Useage: approach IP Port User PolicyDBName\n");
    printf("approach User@IP:(Port = 3306) PolicyDBName\n");

    exit(0);
}

void programCrash(int crashCode)
{
    exit(crashCode);
}

typedef enum{
    eApproachType_Policy,
    eApproachType_Act
}APPROACH_TYPE;

MYSQL* connectDB(char* ip, char* user, char* password, char* dbName, int port);
void closeDB(MYSQL* db, MYSQL_RES* res);

MYSQL_RES* runQuery(MYSQL* db, char* query);
void setKoreaLanguage(MYSQL* db);

MYSQL_RES* getPolicySQLResult(MYSQL* db, const char* tableName);
MYSQL_RES* getKeySQLResult(MYSQL* db, const char* tableName);          // 키 관련 테이블 로드 (폐기일자는 null 이면서 상태는 정상인 값)
MYSQL_RES* getAccessSQLResult(MYSQL* db, const char* tableName);     // 접근 제어 관련 테이블 로드 (삭제일자가 null인 값)
MYSQL_RES* getWorkCtrlSQLResult(MYSQL* db, const char* tableName);   // 작업 통제 테이블 로드 (승인일자가 not null인 값)

char* resultFetchRow(MYSQL_RES* result/*, int resultRow, int fieldCnt, int* dataSize*/);

char*** allocMemory(int resultRow, int fieldCnt);
void freeMemory(char*** array, int resultRow, int fieldCnt);

/**
1. Table arg 관련 부분 모두 제거
2. argv[] ----> Test case 에 맞춰 편리하게.... const 변수로 하나 등록
3. ip db id ..... pw
*/

int main(int argc, const char* argv[])
{
    if( argv[1] == NULL )
        help();

    const char* tempip = argv[1];

    struct DBInfo dbInfo;
    initDBInfo(dbInfo);

    int dbNameArgvIndex = -1;
    char* alreadyAtCharacter = strchr(tempip, '@');
    if( alreadyAtCharacter != NULL )
    {
        int userCnt = strcspn(tempip, "@");
        dbInfo.user = (char*)calloc(userCnt + 1, sizeof(char));
        strncpy(dbInfo.user, tempip, userCnt);

        // Port Setting
        char* tempPort = strchr(tempip, ':');
        if( tempPort == NULL )
        {
            dbInfo.port = 3306;
            char* tempStr = ++alreadyAtCharacter;
            dbInfo.ip = (char*)calloc(strlen(tempStr), sizeof(char));
            strcpy(dbInfo.ip, tempStr);
        }
        else
        {
            dbInfo.port = atoi((++tempPort));
            char* tempStr = ++alreadyAtCharacter;
            int ipCnt = strcspn(tempStr, ":");
            dbInfo.ip = (char*)calloc(ipCnt, sizeof(char));
            strncpy(dbInfo.ip, tempStr, ipCnt);
        }

        dbNameArgvIndex = 2;
    }
    else
    {
        dbInfo.ip = (char*)calloc(strlen(tempip), sizeof(char));
        strcpy(dbInfo.ip, tempip);
        dbInfo.port = atoi(argv[2]);

        dbInfo.user = (char*)calloc(strlen(argv[3]), sizeof(char));
        strcpy(dbInfo.user, argv[3]);

        dbNameArgvIndex = 4;
    }

    dbInfo.dbName = (char*)malloc(sizeof(char) * strlen(argv[dbNameArgvIndex]));
    strcpy(dbInfo.dbName, argv[dbNameArgvIndex]);

    dbInfo.passwd = (char*)malloc(sizeof(char) * 128);
    dbInfo.passwd = getpass("Password : ");

    printf("Data\nuser : %s, ip : %s, port : %d, password : %s, dbName : %s\n",
    dbInfo.user, dbInfo.ip, dbInfo.port, "******", dbInfo.dbName);

    MYSQL* db = connectDB(dbInfo.ip, dbInfo.user, dbInfo.passwd, dbInfo.dbName, dbInfo.port);
    free(dbInfo.ip);
    free(dbInfo.user);
    free(dbInfo.passwd);
    // fo4s add a line bellow
    free(dbInfo.dbName);

    if( db == NULL )
    {
        printf("DB Connect failed\n");
        programCrash(-2);
    }
    printf("DB Connecter create success\n\n");

    setKoreaLanguage(db);

    // 글로벌별 암호 정책 테이블
    MYSQL_RES* globalPolicyResult = getPolicySQLResult(db, "GLOBAL_ENCRYPT_POLICY");
    // 컬름별 암호 정책 테이블
    MYSQL_RES* cryptPolicyResult = getPolicySQLResult(db, "COLUMN_ENCRYPT_POLICY");
    // 정책기반 접근제어 테이블
    MYSQL_RES* accessCtrlPolicyResult = getAccessSQLResult(db, "POLICY_ACCESS_CONTROL");
    // 행위기반 접근제어 테이블
    MYSQL_RES* accessCtrlBehaviorResult = getAccessSQLResult(db, "BEHAVIOR_ACCESS_CONTROL");
    // 키 테이블
    MYSQL_RES* keyCryptResult = getKeySQLResult(db, "DATA_ENCRYPT_KEY");
    // 키 암호키 테이블
    MYSQL_RES* kekCryptResult = getKeySQLResult(db, "KEY_ENCRYPT_KEY");
    // 작업 통제 테이블
    MYSQL_RES* workCtrlResult = getWorkCtrlSQLResult(db, "WORK_CONTROL");

    // DB 데이터를 내부메모리로 복사하는 작업
    char* pGlobalPolicy = resultFetchRow(globalPolicyResult);
    char* pCryptPolicy = resultFetchRow(cryptPolicyResult);
    char* pPolicyAccessControl = resultFetchRow(accessCtrlPolicyResult);
    char* pBehaviorAccessControl = resultFetchRow(accessCtrlBehaviorResult);
    char* pKey = resultFetchRow(keyCryptResult);
    char* pKek = resultFetchRow(kekCryptResult);
    char* pWorkControl = resultFetchRow(workCtrlResult);

#ifdef DEBUG_MODE
    printf("\n\n$$$$ dat1 : %s\n\n", pGlobalPolicy);
    printf("\n\n$$$$ dat2 : %s\n\n", pCryptPolicy);
    printf("\n\n$$$$ dat3 : %s\n\n", pPolicyAccessControl);
    printf("\n\n$$$$ dat4 : %s\n\n", pBehaviorAccessControl);
    printf("\n\n$$$$ dat5 : %s\n\n", pKey);
    printf("\n\n$$$$ dat6 : %s\n\n", pKek);
    printf("\n\n$$$$ dat7 : %s\n\n", pWorkControl);
#endif

    // 공유메모리 할당 작업
    char* global_policy_shm_addr = createSharedMemory(GLOBAL_POLICY_SHARED_MEMORY_KEY, GLOBAL_POLICY_SHARED_MEMORY_SIZE);
    if( pGlobalPolicy != NULL ){
        writeSharedMemory(global_policy_shm_addr, pGlobalPolicy);
        free(pGlobalPolicy);
    }
    releaseSharedMemory(global_policy_shm_addr);


    char* crypt_policy_shm_addr = createSharedMemory(CRYPT_POLICY_SHARED_MEMORY_KEY, CRYPT_POLICY_SHARED_MEMORY_SIZE);
    if( pCryptPolicy != NULL ){
        writeSharedMemory(crypt_policy_shm_addr, pCryptPolicy);
        free(pCryptPolicy);
    }
    releaseSharedMemory(crypt_policy_shm_addr);


    char* access_policy_shm_addr = createSharedMemory(ACCESS_POLICY_SHARED_MEMORY_KEY, ACCESS_POLICY_SHARED_MEMORY_SIZE);
    if( pPolicyAccessControl != NULL ){
        writeSharedMemory(access_policy_shm_addr, pPolicyAccessControl);
        free(pPolicyAccessControl);
    }
    releaseSharedMemory(access_policy_shm_addr);

    char* access_behavior_shm_addr = createSharedMemory(ACCESS_BEHAVIOR_SHARED_MEMORY_KEY, ACCESS_BEHAVIOR_SHARED_MEMORY_SIZE);
    if( pBehaviorAccessControl != NULL ){
        writeSharedMemory(access_behavior_shm_addr, pBehaviorAccessControl);
        free(pBehaviorAccessControl);
    }
    releaseSharedMemory(access_behavior_shm_addr);

    char* key_shm_addr = createSharedMemory(KEY_SHARED_MEMORY_KEY, KEY_SHARED_MEMORY_SIZE);
    if( pKey != NULL ){
        struct CryptionInfo info;
        cryptionInfoInit(&info);

        info.algo = GCRY_CIPHER_SEED;
        info.mode = GCRY_CIPHER_MODE_ECB;

        size_t kekLength = strlen(pKek);
        info.key = (char*)calloc(kekLength, sizeof(char));
        memcpy(info.key, pKek, kekLength);

        char* decKey = decryptionInfo(pKey, info);
        char* oriKey = hexsToStrWithLength(decKey, 16);

        writeSharedMemory(key_shm_addr, oriKey);

        free(pKey);
        free(pKek);

        cryptionInfoRelease(info);
    }
    releaseSharedMemory(key_shm_addr);

    char* work_control_shm_addr = createSharedMemory(WORK_CONTROL_SHARED_MEMORY_KEY, WORK_CONTROL_SHARED_MEMORY_SIZE);
    if( pWorkControl != NULL ){
        writeSharedMemory(work_control_shm_addr, pWorkControl);

        // TODO: attach to work sm

        free(pWorkControl);
    }
    releaseSharedMemory(work_control_shm_addr);

    char* tempUserBehaviorSM = createSharedMemory(USER_BEHAVIOR_SHARED_MEMORY_KEY, USER_BEHAVIOR_SHARED_MEMORY_SIZE);
    releaseSharedMemory(tempUserBehaviorSM);

    printf("Shared Memory alloc success\n");

    mysql_close(db);

    printf("DB Close\n\n");

    return 0;
}


char*** allocMemory(int resultRow, int fieldCnt)
{
    // 데이터가 없을 경우 예외처리
    if( resultRow == 0 || fieldCnt == 0 )
        return NULL;

    char*** array = (char***)calloc(resultRow, sizeof(char**));
    for(int i = 0 ; i < resultRow ; ++i)
    {
        array[i] = (char**)calloc(fieldCnt, sizeof(char*));
    }

    return array;
}

void freeMemory(char*** array, int resultRow, int fieldCnt)
{
    if( array == NULL )
        return;

    printf("freeMemory : %d %d\n", resultRow, fieldCnt);
    for(int i = 0 ; i < resultRow ; ++i)
    {
        for(int j = 0 ; j < fieldCnt ; ++j)
        {
            if( array[i][j] != NULL )
            {
                #ifdef DEBUG_MODE
                    printf("dealloc %d, %d, %p ==> %s\n", i, j, array[i][j], array[i][j]);
                #endif
                free(array[i][j]);
                array[i][j] = NULL;
            }
        }
        free(array[i]);
        array[i] = NULL;
    }

    free(array);
    array = NULL;
}


MYSQL* connectDB(char* ip, char* user, char* password, char* dbName, int port)
{
    MYSQL* db = mysql_init(NULL);
    if( db == NULL )
    {
        return NULL;
    }

    if( !mysql_real_connect(db, ip, user, password, dbName, port, (char*)NULL, 0) )
    {
        mysql_close(db);
        return NULL;
    }

    return db;
}

void closeDB(MYSQL* db, MYSQL_RES* res)
{
    mysql_close(db);
}

MYSQL_RES* runQuery(MYSQL* db, char* query)
{
    if( mysql_query(db, query) ){
        printf("error query : %s (%s)", query, mysql_error(db));
        programCrash(-3);
        return NULL;
    }
    return mysql_store_result(db);
}

void setKoreaLanguage(MYSQL* db)
{
    // show korea language
    runQuery(db, "set session character_set_connection=utf8");
    runQuery(db, "set session character_set_results=utf8");
    runQuery(db, "set session character_set_client=utf8");
    runQuery(db, "set names utf8");
}

MYSQL_RES* getPolicySQLResult(MYSQL* db, const char* tableName)
{
    MYSQL_RES* res = NULL;
    char query[64] = {'\0', };
    char query2[128] = {'\0', };
    sprintf(query, "SELECT * FROM %s", tableName);
    sprintf(query2, "UPDATE %s SET SYSTEM_APPLY_DATE = FLOOR(NOW()+0)", tableName);
    res = runQuery(db, query);
    runQuery(db, query2);

    return res;
}

MYSQL_RES* getKeySQLResult(MYSQL* db, const char* tableName)
{
    MYSQL_RES* res = NULL;
    char query[128] = {'\0', };
    sprintf(query, "SELECT ENCRYPT_KEY FROM %s WHERE DISCARD_DATE IS NULL AND STATE IS NULL", tableName);
    res = runQuery(db, query);

    return res;
}

MYSQL_RES* getAccessSQLResult(MYSQL* db, const char* tableName)
{
    MYSQL_RES* res = NULL;
    char query[64] = {'\0', };
    sprintf(query, "SELECT * FROM %s WHERE DELETE_DATE IS NULL", tableName);
    res = runQuery(db, query);

    return res;
}

MYSQL_RES* getWorkCtrlSQLResult(MYSQL* db, const char* tableName)
{
    MYSQL_RES* res = NULL;
    char query[64] = {'\0', };
    char query2[128] = {'\0', };
    sprintf(query, "SELECT * FROM %s WHERE APPROVE_TIME IS NOT NULL", tableName);
    sprintf(query2, "UPDATE %s SET SYSTEM_APPLY_DATE = FLOOR(NOW()+0) WHERE APPROVE_TIME IS NOT NULL", tableName);
    res = runQuery(db, query);
    runQuery(db, query2);

    return res;
}

char* resultFetchRow(MYSQL_RES* result/*, int resultRow, int fieldCnt, int* dataSize*/)
{
    int resultRow = mysql_num_rows(result);
    int fieldCnt = mysql_num_fields(result);
    printf("ResultRow : %d, FieldCnt : %d\n====================================\n", resultRow, fieldCnt);
    char*** array = allocMemory(resultRow, fieldCnt);

    if( array == NULL )
        return NULL;

    MYSQL_FIELD* sqlFields;
    int size = 0;
    size_t dataLength;
    MYSQL_ROW row;
    int rowIndex = -1;

    for(int i = 0 ; (sqlFields = mysql_fetch_field(result)) ; ++i)
    {
        printf("%s\t", sqlFields->name);
    }
    printf("\n");

    while( (row = mysql_fetch_row(result)) != NULL ) 
    {
        rowIndex++;
        for(int i = 0 ; i < fieldCnt ; ++i)
        {
            //printf("Index %d/%d %d/%d\n", rowIndex, globalPolicyResultRow, i, fieldCnt);

            // 데이터가 있는 경우
            if( row[i] )
            {
                #ifdef DEBUG_MODE
                    printf("\nCheck : %s %d, %d, %d %p\n", row[i], (int)strlen(row[i]), rowIndex, i, array[rowIndex][i]);
                #endif
                
                if( i != fieldCnt - 1 )
                    dataLength = strlen(row[i]) + strlen(DATA_SPLIT_STR);
                else
                    dataLength = strlen(row[i]) + 1;

                array[rowIndex][i] = (char*)calloc(dataLength, sizeof(char));
                #ifdef DEBUG_MODE
                if( array[rowIndex][i] == NULL )
                    printf("%d %d memory allocate failed\n", rowIndex, i);
                #endif
                memcpy(array[rowIndex][i], row[i], dataLength);
                size += dataLength;
            }
            // 데이터가 없는 경우 (null 인 경우)
            else
            {
                if( i != fieldCnt - 1 )
                    size += strlen(DATA_SPLIT_STR);
                array[rowIndex][i] = NULL;
                continue;
            }
        }
        if( rowIndex != resultRow - 1 )
            size += strlen(LINE_SPLIT_STR);
    }

    printf("Data Fetch Success\n");
    size += 1;
    char* policy = (char*)calloc(size, sizeof(char));
    for(int i = 0 ; i < resultRow ; ++i)
    {
        for(int j = 0 ; j < fieldCnt ; ++j)
        {
            // 데이터가 null 이 아니었다면 값을 반영한다
            if( array[i][j] != NULL )
            {
                strncat(policy, array[i][j], strlen(array[i][j]));
            }

            // 마지막 데이터는 데이터구분자를 입력하지 않는다. 
            if( j != fieldCnt - 1 )
            {
                strncat(policy, DATA_SPLIT_STR, strlen(DATA_SPLIT_STR));
            }
        }

        // 마지막 데이터는 라인구분자를 입력하지 않는다.
        if( i != resultRow - 1 )
        {
            strncat(policy, LINE_SPLIT_STR, strlen(LINE_SPLIT_STR));
        }
    }

    freeMemory(array, resultRow, fieldCnt);

    printf("Memory Dealloc Finish\n");

    if( result )
        mysql_free_result(result);

    return policy;

    printf("Data Reorder Success\n");

    printf("result Fetch Finish, Size : %d\n", (size-1));
}
