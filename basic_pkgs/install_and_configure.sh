#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

prefix=/usr/local/

# ostree
cd ~/ostree && make install -j$(nproc)

# golang
cd ~/${GOPATH}

go_version=`cat VERSION`

mkdir ${prefix}/share/${go_version} ${prefix}/lib/${go_version}

cp bin     ${prefix}/lib/${go_version}
cp pkg     ${prefix}/lib/${go_version}
cp VERSION ${prefix}/lib/${go_version}
cp src     ${prefix}/share/${go_version}
cp test    ${prefix}/share/${go_version}

#     TARGET                             LINK_NAME
ln -s ${prefix}/lib/${go_version}        ${prefix}/lib/go
ln -s ${prefix}/share/${go_version}/src  ${prefix}/lib/${go_version}/src
ln -s ${prefix}/share/${go_version}/test ${prefix}/lib/${go_version}/test
ln -s ${prefix}/lib/go/bin/go            ${prefix}/bin/go
ln -s ${prefix}/lib/go/bin/gofmt         ${prefix}/bin/gofmt

# conmon
cd ~/conmon && make podman

# runc
cp $GOPATH/src/github.com/opencontainers/runc/runc ${prefix}/bin/

# Configuration of podman
cd ~/rootless-podman-builds/basic_pkgs/configurations
## Setup CNI networking
mkdir -p /etc/cni/net.d
cp 87-podman-bridge.conf /etc/cni/net.d/87-podman-bridge.conf

## Container configuration
mkdir -p /etc/containers
cp registries.conf /etc/containers/registries.conf
cp policy.json     /etc/containers/policy.json
cp seccomp.json    /usr/share/containers/seccomp.json
