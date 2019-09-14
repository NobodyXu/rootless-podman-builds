#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

git clone https://go.googlesource.com/go $GOPATH

cd $GOPATH
git checkout tags/`git tag -l | grep ^go* | sort -V | grep tail -n 1`

cd src
source ./all.bash
