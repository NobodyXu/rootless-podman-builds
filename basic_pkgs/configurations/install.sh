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

## Enable user namespace
echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/userns.conf

## Check user.max_user_namespaces to see if its is reasonable
## Especially on RHEL 7 machines.
if [ `sysctl -n user.max_user_namespaces` -le 1000 ]; then
	sysctl user.max_user_namespaces=15000
fi

## Enable cgroup v2 support
## Adapted from:
##     https://unix.stackexchange.com/questions/471476/how-do-i-check-cgroup-v2-is-installed-on-my-machine
if grep -q cgroup2 /proc/filesystems; then
	podman --runtime /usr/bin/crun
fi
