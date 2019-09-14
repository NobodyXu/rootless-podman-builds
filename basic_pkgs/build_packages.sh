#!/bin/bash

cd $1

exec checkinstall -D -A amd64 \
	          --pkgname $(1) \
		  --pkgversion `cat version` \
		  --pkgrelease `cat release` \
		  --pkglicense `cat license` \
		  --maintainer `cat maintainer` \
		  --requires `cat requires` \
		  ./install.sh
