#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

git clone https://github.com/opencontainers/runc.git $GOPATH/src/github.com/opencontainers/runc

cd $GOPATH/src/github.com/opencontainers/runc
exec make BUILDTAGS="selinux seccomp" -j$(nproc)
