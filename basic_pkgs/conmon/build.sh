#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

git clone https://github.com/containers/conmon
cd conmon

export GOCACHE="$(mktemp -d)"
exec make -j$(nproc)
