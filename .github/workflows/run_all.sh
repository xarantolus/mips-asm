#!/usr/bin/bash

ABSOLUTE=$(pwd)/.github/workflows/run_one.sh

find ./*/ -type f -name Makefile -execdir bash $ABSOLUTE {} \;
