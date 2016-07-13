#
  #
  # Copyright (C) 2011 Seungwoo Baek, Jimant technology,Inc.
  #
  # Licensed under the LGPL v3 see the file LICENSE in base directory.
  #
#

#!/bin/bash

if [ -z $MYSQL_PASSWD ]; then
    echo "mysql password required"
    exit 0
fi

$JIMANT_ROOT_PATH/policy/apache/apache-tomcat-6.0.41/bin/startup.sh

# only when first installation
mysql -u root -p$MYSQL_PASSWD < ./sql/database.sql
mysql -u root -p$MYSQL_PASSWD FO4S < ./sql/FO4S.sql
