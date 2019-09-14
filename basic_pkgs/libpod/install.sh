#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

cd $GOPATH/src/github.com/containers/libpod
exec make install
