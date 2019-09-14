FROM debian:buster

RUN apt-get update && apt intall -y curl git build-essential automake bison libtool zlib1g libapparmor-dev libsystemd-dev checkinstall

ENV GOPATH=~/go
ENV PATH=$GOPATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
