#!/bin/bash
# 2015 (c) - Felipe Astroza A.
. common.sh

mkdir -p $LIBS_PREFIX
mkdir -p $GCC_ROOT
mkdir -p $SRC
mkdir -p $BUILD

for url in $(cat download_list); do
	url_wos=${url:7}
	filename=${url_wos##*/}
	if [ ! -f $SRC/$filename ]; then
		wget -P $SRC $url
	fi
done
