#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

echo "Installing YASM"
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz && \
tar xvzf yasm-1.2.0.tar.gz && \
cd $HOME/vlc_build/yasm-1.2.0 && \
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
            $ARCHOPTS && \
make && make install

