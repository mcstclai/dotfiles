#!/bin/bash
pushd ~/vim
make distclean
./configure \
	--with-features=huge \
       	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-python3interp=dynamic \
	--with-python3-config-dir=$(python3-config --configdir) \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=/usr
make VIMRUNTIMEDIR=~/vim/runtime VIMDIR=~/vim/src
popd
