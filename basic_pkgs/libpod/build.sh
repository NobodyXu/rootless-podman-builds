#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

git clone https://github.com/containers/libpod/ $GOPATH/src/github.com/containers/libpod

cd $GOPATH/src/github.com/containers/libpod
exec make BUILDTAGS="selinux seccomp apparmor systemd ostree" -j$(nproc)
