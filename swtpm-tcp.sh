#!/bin/bash
set -e

SPORT=2321
CPORT=2322

swtpm socket \
    --tpm2 \
    --tpmstate dir=./.swtpm \
    --server type=tcp,port=$SPORT \
    --ctrl type=tcp,port=$CPORT \
    --flags not-need-init,startup-clear \
    --log file=-
