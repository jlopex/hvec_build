#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/vlc_build/vlcdeps/usr/bin

echo "Installing FDK_AAC"

cd $HOME/vlc_build
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv && \
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
            $ARCHOPTS \
            --disable-shared \
            --enable-static && \
make && make install && make distclean

