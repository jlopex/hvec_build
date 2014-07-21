#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

echo "Installing CMAKE"
wget http://www.cmake.org/files/v3.0/cmake-3.0.0.tar.gz &&
tar xvzf cmake-3.0.0.tar.gz && \
cd $HOME/vlc_build/cmake-3.0.0 && \
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
            $ARCHOPTS && \
make && make install

