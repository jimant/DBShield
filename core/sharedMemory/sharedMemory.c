/*
  *
  * Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  *
  * Licensed under the LGPL v3 see the file LICENSE in base directory.
  *
*/

#include "sharedMemory.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <errno.h>

// ipC
#include <unistd.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#include <sys/types.h>
#include <sys/mman.h>

#include <syslog.h>

 void writeMemoryLog(const char* message)
 {
    openlog("jimant", LOG_PID | LOG_CONS, LOG_USER);
    char logBuf[256] = {'\0', };
    sprintf(logBuf, "%s|%s", "SYSLOG", message);
    syslog(LOG_ERR, logBuf);
    closelog();
 }

void* createSharedMemory(int memory_key, int memory_size)
{
    int shm_id = -1;
    void* shm_addr = NULL;
    
    /*
        owner - 6
        group - 6
        other - 0
    */
    if( -1 == (shm_id = shmget((key_t)memory_key, memory_size, IPC_CREAT | IPC_EXCL | 0666)) )
    {
        // printf("Create shared memory failed\n");
        printf("createSharedMemory: shmget Failed\n");
        writeMemoryLog("Create shared memory: shmget failed");
        return NULL;
    }


    // shared Memory Fetch
    if( (void*)-1 == (shm_addr = shmat(shm_id, (void*)0, 0)) )
    {
        printf("createSharedMemory: shmat Failed\n");
        writeMemoryLog("Create shared memory: shmat failed");
        return NULL;
    }

    return shm_addr;
}

bool releaseSharedMemory(void* shm)
{
    if( shm == NULL )
        return true;

    return shmdt(shm) == -1 ? false : true;
}

bool deleteSharedMemory(int shm_id)
{
    if( shm_id == 0 )
        return true;

    return shmctl(shm_id, IPC_RMID, 0) == -1 ? false : true;
}

void* getSharedMemory(int memory_key, int memory_size)
{
    int shm_id = -1;
    void* shm_addr = NULL;

    if( -1 == (shm_id = shmget((key_t)memory_key, memory_size, 0)) )
    {
        #ifdef __DEBUG_MODE
        printf("getSharedMemory: shmget Failed - key : %d, size : %d\n", memory_key, memory_size);
        #endif
        char logBuf[96] = {'\0', };
        sprintf(logBuf, "getSharedMemory: shmget Failed - %d, %d - %d, %s", memory_key, memory_size, errno, strerror(errno));
        writeMemoryLog(logBuf);
        return NULL;
    }
#ifdef DEBUG_MODE
    printf("getSharedMemory: key : %d, size : %d\n", memory_key, memory_size);
    printf("getSharedMemory: memory id : %d\n", shm_id);
#endif

    // SHM_RDONLY
    if( (void*)-1 == (shm_addr = shmat(shm_id, (void*)0, 0)) )
    {
        #ifdef __DEBUG_MODE__
        perror("getSharedMemory - shmat");
        printf("%d %s\n", errno, strerror(errno));
        #endif
        char logBuf[96] = {'\0', };
        sprintf(logBuf, "getSharedMemory: shmat Failed - %d, %d - %d, %s", memory_key, memory_size, errno, strerror(errno));
        writeMemoryLog(logBuf);
        
        return NULL;
    }
    
    return shm_addr;
}

bool writeSharedMemory(void* sharedMemory, char* data)
{
    strcpy(sharedMemory, data);
    // sprintf((char*)sharedMemory, data);

    return true;
}
