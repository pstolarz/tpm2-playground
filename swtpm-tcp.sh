#!/bin/bash
set -e

. ./setenv.sh
: ${SWTPM_PORT:=2321}

swtpm socket \
    --tpm2 \
    --tpmstate dir=$(dirname $0)/.swtpm \
    --server type=tcp,port=${SWTPM_PORT} \
    --ctrl type=tcp,port=$(( ${SWTPM_PORT} + 1 )) \
    --flags not-need-init,startup-clear \
    --log level=5
