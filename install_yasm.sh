#!/bin/bash

FILE=yasm-1.2.0.tar.gz

if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi

echo "Installing YASM"
if [ ! -f $FILE ]; then
    echo "File not found!"
    wget http://www.tortall.net/projects/yasm/releases/$FILE
fi

tar xvzf $FILE && \
cd $HOME/hvec_build/yasm-1.2.0 && \
./configure --prefix=$HOME/hvec_build/hvecdeps/usr \
            $ARCHOPTS && \
make -j24 && make install

