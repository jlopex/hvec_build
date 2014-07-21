#!/bin/bash
echo "Installing FFMPEG"
sudo apt-get -y install libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev zlib1g-dev
cd $HOME/vlc_build
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg 
export PATH=$PATH:/$HOME/vlc_build/vlcdeps/usr/bin
cd ffmpeg && \
if [ "$(uname -m)" = "x86_64" ]; then
  ARCHOPTS="--enable-pic"
 else
  ARCHOPTS=""
fi && \
CPPFLAGS="-I$HOME/vlc_build/vlcdeps/usr/include" \
LDFLAGS="-L$HOME/vlc_build/vlcdeps/usr/lib" \
PKG_CONFIG_PATH="$HOME/vlc_build/vlcdeps/usr/lib/pkgconfig" \
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
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
            --disable-programs \
            --disable-doc \
            --disable-filters \
            --disable-avdevice \
            --disable-devices \
            --disable-avfilter \
            --disable-avresample && \
make -j 2 && make install-libs install-headers && make distclean
