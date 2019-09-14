#!/bin/bash

# This is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md#building-from-scratch

prefix=/usr/local/

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
exec ln -s ${prefix}/lib/go/bin/gofmt         ${prefix}/bin/gofmt
