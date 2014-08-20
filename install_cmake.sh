#!/bin/bash

FILE=cmake-3.0.0.tar.gz

echo "Installing CMAKE"

if [ ! -f $FILE ]; then
    echo "File not found!"
    wget http://www.cmake.org/files/v3.0/$FILE
fi

tar xvzf $FILE && \
cd $HOME/hvec_build/cmake-3.0.0 && \
./configure --prefix=$HOME/hvec_build/hvecdeps/usr && \
make && make install

