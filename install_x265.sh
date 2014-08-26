#!/bin/bash

NPROC=$(nproc)

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/hvec_build/hvecdeps/usr/bin

apt-get install mercurial build-essential

echo "Installing x265"
cd $HOME/hvec_build
hg clone https://bitbucket.org/multicoreware/x265
mkdir -p x265/out
cd x265/out
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=$HOME/hvec_build/hvecdeps/usr ../source/
make -j $NPROC && make install
