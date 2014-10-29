#!/bin/bash

NPROC=$(nproc)

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

PATH=$PATH:/$HOME/hvec_build/hvecdeps/usr/bin
sudo apt-get -y install autoconf libtool 

echo "Installing FDK_AAC"

cd $HOME/hvec_build
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv && \
./configure --prefix=$HOME/hvec_build/hvecdeps/usr \
            $ARCHOPTS \
            --disable-shared \
            --enable-static && \
make -j $NPROC && make install && make distclean

