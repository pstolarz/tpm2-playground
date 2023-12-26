#!/bin/bash
set -e

. ./setenv.sh

swtpm socket --tpmstate dir=$(dirname $0)/.swtpm \
    --tpm2 \
    --server type=tcp,port=2321 \
    --ctrl type=tcp,port=2322 \
    --flags not-need-init,startup-clear \
    --log level=5
