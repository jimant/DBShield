#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash
# cut 명령에서 -d 옵션은 필드간 구분자를 지정할 수 있다.
# 여기서 " " 공백을 지정했다.
# -f 옵션은 몇번째 필드 값을 볼 것인지를 지정한다.

#MSGID=`ipcs -q | grep $USER | cut -d " " -f 2`
SEMID=`ipcs -s | grep $USER | cut -d " " -f 2`
SHMID=`ipcs -m | egrep 'root|$USER' | cut -d " " -f 2`

for sem in $SEMID
do
ipcrm -s $sem
done

for shm in $SHMID
do
ipcrm -m $shm
done
