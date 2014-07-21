#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/vlc_build/vlcdeps/usr/bin

sudo apt-get install mercurial build-essential

echo "Installing x265"
cd $HOME/vlc_build
hg clone https://bitbucket.org/multicoreware/x265
mkdir -p x265/out
cd x265/out
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=$HOME/vlc_build/vlcdeps/usr ../source/
make -j2 && make install
