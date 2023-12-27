#!/bin/bash
set -e

if [ $(id -u) -ne 0 ]; then
    echo "root required" >&2
    exit 1
fi

source $(dirname $0)/setenv

if [ -e ${ROOT_DIR}/tabrmd.pid ]; then
    echo "tabrmd is already ruinning..." >&2
    exit 1
fi

cd ${INSTALL_DIR}/sbin
sudo runuser --user tss -- ./tpm2-abrmd -t swtpm&

echo "$!" >${ROOT_DIR}/tabrmd.pid
echo "tabrmd started; pid:$(cat ${ROOT_DIR}/tabrmd.pid)"
