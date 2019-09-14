#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

exec cp $GOPATH/src/github.com/opencontainers/runc/runc /usr/local/bin/
