#!/bin/bash

NPROC=$(nproc)

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/hvec_build/hvecdeps/usr/bin

echo "Installing x264"
cd $HOME/hvec_build
git clone git://git.videolan.org/x264.git --depth 1
cd x264
./configure --prefix=$HOME/hvec_build/hvecdeps/usr \
            --enable-static \
            --disable-cli \
            $ARCHOPTS && \
make -j $NPROC && make install
