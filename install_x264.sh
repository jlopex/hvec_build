#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/vlc_build/vlcdeps/usr/bin

echo "Installing x264"
cd $HOME/vlc_build
git clone git://git.videolan.org/x264.git --depth 1
cd x264
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
            --enable-static \
            --disable-cli \
            $ARCHOPTS && \
make && make install
