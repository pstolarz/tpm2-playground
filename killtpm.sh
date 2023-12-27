#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "root required" >&2
    exit 1
fi

source $(dirname $0)/setenv

if [ -e ${ROOT_DIR}/swtpm.pid ]; then
    kill $(cat ${ROOT_DIR}/swtpm.pid) 2>/dev/null
    [ $? -eq 0 ] && echo "swtpm killed"
    rm -f ${ROOT_DIR}/swtpm.pid
fi

if [ -e ${ROOT_DIR}/tabrmd.pid ]; then
    sudo kill $(cat ${ROOT_DIR}/tabrmd.pid) 2>/dev/null
    [ $? -eq 0 ] && echo "tabrmd killed"
    rm -f ${ROOT_DIR}/tabrmd.pid
fi
