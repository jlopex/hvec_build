#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/hvec_build/hvecdeps/usr/bin

echo "Installing FDK_AAC"

cd $HOME/hvec_build
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv && \
./configure --prefix=$HOME/hvec_build/hvecdeps/usr \
            $ARCHOPTS \
            --disable-shared \
            --enable-static && \
make -j24 && make install && make distclean

