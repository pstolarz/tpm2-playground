#!/bin/bash
set -e

source $(dirname $0)/setenv
: ${SWTPM_PORT:=2321}

if [ -e ${ROOT_DIR}/swtpm.pid ]; then
    echo "swtpm is already ruinning..." >&2
    exit 1
fi

swtpm socket \
    --tpm2 \
    --tpmstate dir=${ROOT_DIR}/.swtpm \
    --server type=tcp,port=${SWTPM_PORT} \
    --ctrl type=tcp,port=$(( ${SWTPM_PORT} + 1 )) \
    --flags not-need-init,startup-clear \
    --log file=-&

echo "$!" >${ROOT_DIR}/swtpm.pid
echo "swtpm started; pid:$(cat ${ROOT_DIR}/swtpm.pid)"
