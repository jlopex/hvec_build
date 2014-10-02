#!/bin/bash

NPROC=$(nproc)

echo "Installing FFMPEG"
sudo apt-get -y install libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev zlib1g-dev pkg-config
cd $HOME/vlc_build
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg 
export PATH=$PATH:/$HOME/hvec_build/hvecdeps/usr/bin
cd ffmpeg && \
if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi && \
CPPFLAGS="-I$HOME/hvec_build/hvecdeps/usr/include" \
LDFLAGS="-L$HOME/hvec_build/hvecdeps/usr/lib" \
PKG_CONFIG_PATH="$HOME/hvec_build/hvecdeps/usr/lib/pkgconfig" \
./configure --prefix=$HOME/hvec_build/hvecdeps/usr \
            $ARCHOPTS \
            --extra-libs="-ldl" \
            --enable-gpl \
            --enable-version3 \
            --enable-nonfree \
            --enable-libmp3lame \
            --enable-libopencore-amrnb \
            --enable-libopencore-amrwb \
            --enable-libfdk-aac \
            --enable-libx264 \
            --enable-libx265 \
            --disable-doc
##            --disable-programs \
##            --disable-filters \
##            --disable-avdevice \
##            --disable-devices \
##            --disable-avfilter \
##            --disable-avresample && \
make -j $NPROC && make install && make distclean
