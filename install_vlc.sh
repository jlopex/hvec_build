echo "INSTALLING VLC"
cd $HOME/vlc_build
git clone git://git.videolan.org/vlc.git --depth 1
cd $HOME/vlc_build/vlc && ./bootstrap && \
CPPFLAGS="-I$HOME/vlc_build/vlcdeps/usr/include" \
LDFLAGS="-L$HOME/vlc_build/vlcdeps/usr/lib" \
PKG_CONFIG_PATH="$HOME/vlc_build/vlcdeps/usr/lib/pkgconfig" \
./configure --prefix=$HOME/vlc_build/out \
	    --enable-x265 && \
make -j 2 && sudo ldconfig 
#&& make install
#mkdir -vp doc-pak && cp -v AUTHORS COPYING INSTALL NEWS README THANKS doc-pak && \
#sudo checkinstall --pakdir "$HOME/vlc_build" --backup=no --deldoc=yes --pkgname vlc \
#                  --pkgversion "3.0.0-git~$(git rev-parse --short HEAD)" \
#                  --fstrans=no --deldesc=yes --delspec=yes --default && \
#make distclean && sudo ldconfig
