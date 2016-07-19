#!/bin/bash

function install_help()
{
    local ac_help=" "

    ac_help=" $ac_help
        --with-php          php plugin install\n"

    ac_help="$ac_help
        --with-mysql        mysql plugin install\n"

    ac_help="$ac_help
        --with-oracle       oracle plugin install\n"

    ac_help="$ac_help
        --with-policy       policy install\n"

    ac_help="$ac_help
        --with-policy=<DIR>   policy install. DIR is apache ROOT directory\n"

    echo -e "$ac_help"

    echo "Installation Prerequisites : gpg-error, gcrypt, mysql java java-1.7.0-openjdk-devel"
}
INSTALL_ARGS="--with-jni";

function core_install()
{
    echo $INSTALL_ARGS
    # core
    cd $JIMANT_ROOT_PATH/core/
    chmod +x dist.sh
    ./dist.sh $INSTALL_ARGS
}

function plugin_install()
{
    #plugin - PHP
    cd $JIMANT_ROOT_PATH/plugin
    chmod +x dist.sh
    ./dist.sh $INSTALL_ARGS
}

function input_mysql_passwd()
{
    if [ -z $MYSQL_PASSWD ]; then
        while true; do
            echo "Enter mysql root password : "
            read -s MYSQL_PASSWD

            echo "Retype mysql root password : "
            read -s MYSQL_CONFIRM_PASSWD

            if [ ${MYSQL_PASSWD} = ${MYSQL_CONFIRM_PASSWD} ]; then
                echo -e "password match!\n"
                export MYSQL_PASSWD
                break;
            else
                echo -e "password miss match, Try again\n"
            fi
        done
    fi
}

function policy_install()
{
    #Policy install - apache
    cd $JIMANT_ROOT_PATH/policy
    chmod +x dist.sh
    ./dist.sh $MYSQL_PASSWD
}

install_help

echo "--------------- install start ---------------"

SCRIPT=$(readlink -f "$0")
JIMANT_ROOT_PATH=$(dirname "$SCRIPT")

export JIMANT_ROOT_PATH

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    SYS_LIB_PATH="/usr/lib64"
else
    SYS_LIB_PATH="/usr/lib"
fi

export SYS_LIB_PATH

is_install_policy=0
while test $# -gt 0
do
    case "$1" in
        --with-jni)
        ;;
        --with-php)
	    INSTALL_ARGS="$INSTALL_ARGS $1"
        ;;
    	--with-mysql)
	    INSTALL_ARGS="$INSTALL_ARGS $1"
	    ;;
    	--with-oracle)
	    INSTALL_ARGS="$INSTALL_ARGS $1"
	    ;;
        --*)
                install_help
                echo "Invalid argument $1"
		        exit 0
        ;;
        *)
                install_help
                echo "Invalid argument $1"
		        exit 0
        ;;
    esac
    shift
done

input_mysql_passwd

core_install
plugin_install
policy_install

echo "--------------- install finish ---------------"
