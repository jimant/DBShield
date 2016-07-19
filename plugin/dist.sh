#!/bin/bash

if [ -z ${JIMANT_ROOT_PATH+x} ]; then
	echo "JIMANT_ROOT_PATH required";
	exit 1;
fi

function php_install()
{
    if [ ! -d "/usr/lib64/php/function" ]
	then
	mkdir "/usr/lib64/php/function"
    fi

    cd $PHP_WORK_PATH/jimant_cryption
    chmod +x make.sh
    ./make.sh
    cd ..
    cp cryption.php "/usr/lib64/php/function"
    cd ..
}

function jni_install()
{
    cd $JNI_WORK_PATH/src
    chmod +x make.sh
    ./make.sh
}

function mysql_install()
{
    cd $MYSQL_WORK_PATH/src
    chmod +x make.sh

    ./make.sh $MYSQL_PASSWD
}

function oracle_install()
{
    cd $ORACLE_WORK_PATH/src
    chmod +x make.sh
    ./make.sh
}

echo "--------------- plugin start ---------------"

JIMANT_WORK_ROOT_PATH=$(pwd)

export JIMANT_WORK_ROOT_PATH

PHP_WORK_PATH=$JIMANT_WORK_ROOT_PATH/php
JNI_WORK_PATH=$JIMANT_WORK_ROOT_PATH/jni
MYSQL_WORK_PATH=$JIMANT_WORK_ROOT_PATH/mysql
ORACLE_WORK_PATH=$JIMANT_WORK_ROOT_PATH/oracle

while test $# -gt 0
do
    case "$1" in
	--with-php)
        echo "php"
        php_install
        setenforce 0;
		echo "Check Setting"
		echo "php.ini - enable_dl=On"
        echo "php.ini - extension=jimant_cryption.so"
#		echo "php.ini - extension_dir='/usr/lib64/php/ext/'"
	;;
	--with-jni)
		echo "jni"
        jni_install
	;;
	--with-mysql)
		echo "mysql"
        mysql_install
	;;
    --with-oracle)
        echo "oracle"
        oracle_install
    ;;
	*)
		echo "Invalid argument $1"
        exit 0
	;;
    esac
    shift
done

echo "--------------- plugin end ---------------"
