/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#ifndef __SHARED_MEMORY_H__
#define __SHARED_MEMORY_H__

#include <stdbool.h>
#include <stddef.h>

#define LINE_SPLIT_STR		"!$!"
#define DATA_SPLIT_STR		"!|!"

#define GLOBAL_POLICY_SHARED_MEMORY_KEY    	1000
#define GLOBAL_POLICY_SHARED_MEMORY_SIZE   	(128)

#define CRYPT_POLICY_SHARED_MEMORY_KEY		1001
#define CRYPT_POLICY_SHARED_MEMORY_SIZE		(1024 * 1024 + 0)

#define KEY_SHARED_MEMORY_KEY				1100
#define KEY_SHARED_MEMORY_SIZE				(512)

#define ACCESS_POLICY_SHARED_MEMORY_KEY		1200
#define ACCESS_POLICY_SHARED_MEMORY_SIZE	(1024 * 1024 + 1)

#define ACCESS_BEHAVIOR_SHARED_MEMORY_KEY	1201
#define ACCESS_BEHAVIOR_SHARED_MEMORY_SIZE	(1024 * 1024 + 2)

#define WORK_CONTROL_SHARED_MEMORY_KEY		1300
#define WORK_CONTROL_SHARED_MEMORY_SIZE		(1024 * 1024 + 3)

#define USER_BEHAVIOR_SHARED_MEMORY_KEY		2000
#define USER_BEHAVIOR_SHARED_MEMORY_SIZE	(1024 * 1024 + 4)

#define USER_POLICY_SHARED_MEMORY_KEY		2001
#define USER_POLICY_SHARED_MEMORY_SIZE		(1024 * 1024 + 5)

#define LOG_SHARED_MEMORY_KEY				3000
#define LOG_SHARED_MEMORY_SIZE				(1024 * 1024 * 4 + 6)

#ifdef __cplusplus
extern "C" {
#endif

/**
 *	@brief 		Shared Memory (SM, 공유 메모리) 생성 함수
 *	@details	이미 존재하는 공유 메모리를 생성하려고 하면 에러
 *
 *	@param memory_key 		공유 메모리의 키
 *	@param memory_size 		공유 메모리 사이즈
 *
 *	@return 				생성된 공유 메모리 포인터
 */
void* createSharedMemory(int memory_key, int memory_size);

/**
 *	@brief 		Shared Memory 해제 함수
 *
 *	@param shm 				Shared Memory 포인터
 *
 *	@return 				true - 정상 해제, false - 비정상 해제
 */
bool releaseSharedMemory(void* shm);

/**
 *	@brief 		Shared Memory 삭제 함수
 *
 *	@param shm_id			Shared Memory Id
 *
 *	@return 				true - 정상 해제, false - 비정상 해제
 */
bool deleteSharedMemory(int shm_id);

/**
 *	@brief 		Shared Memory 얻어오는 함수
 *
 *	@param memory_key 		공유 메모리의 키
 *	@param memory_size 		공유 메모리 사이즈
 *
 *	@return 				공유 메모리 포인터
 */
void* getSharedMemory(int memory_key, int memory_size);

/**
 *	@brief 		Shared Memory에 데이터 쓰기
 *
 *	@param sharedMemory 	Shared Memory 포인터
 *	@param data 			Shared Memory에 쓸 데이터
 *
 *	@return 				true - 정상 쓰기, false - 비정상 쓰기
 */
bool writeSharedMemory(void* sharedMemory, char* data);

#ifdef __cplusplus
}
#endif

#endif
