#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

git clone https://github.com/ostreedev/ostree ~/ostree

cd ~/ostree
git checkout tags/`git tag -l | tail -n 1`
git submodule update --init

apt-get install -y e2fsprogs e2fslibs-dev fuse libfuse-dev libgpgme-dev liblzma-dev libseccomp-dev libsystemd-dev

# for all distributions
./autogen.sh --prefix=/usr/local --sysconfdir=/etc
# remove --nonet option due to https:/github.com/ostreedev/ostree/issues/1374
sed -i '/.*--nonet.*/d' ./Makefile-man.am

exec make -j$(nproc)
