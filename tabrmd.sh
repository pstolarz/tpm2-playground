#!/bin/bash
set -e

sudo runuser --user tss -- tpm2-abrmd -t swtpm
