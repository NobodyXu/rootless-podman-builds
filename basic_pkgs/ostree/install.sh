#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

cd ~/ostree
exec make install -j$(nproc)
