#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

cd ~/rootless-podman-builds/basic_pkgs/configurations
## Setup CNI networking
mkdir -p /etc/cni/net.d
cp 87-podman-bridge.conf /etc/cni/net.d/87-podman-bridge.conf

## Container configuration
mkdir -p /etc/containers
cp registries.conf /etc/containers/registries.conf
cp policy.json     /etc/containers/policy.json
cp seccomp.json    /usr/share/containers/seccomp.json
