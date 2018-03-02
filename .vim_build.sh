#!/bin/sh
pushd ~/vim
make distclean
./configure \
	--with-features=huge \
       	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-pythoninterp=dynamic \
	--with-python-config-dir=/usr/lib64/python2.7/config \
	--enable-python3interp=dynamic \
	--with-python3-config-dir=/usr/lib64/python3.4/config-3.4m \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=/usr
make VIMRUNTIMEDIR=/home/matt.stclair/vim/runtime VIMDIR=/home/matt.stclair/vim/src
popd
