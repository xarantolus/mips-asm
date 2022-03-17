#!/usr/bin/bash

GROUP_NAME="$(git ls-files --full-name Makefile)"

# The substitution strips "/Makefile" from the filepath
echo "::group::${GROUP_NAME::-9}"
make clean 2>&1 > /dev/null || true
make run
echo "::endgroup::"
