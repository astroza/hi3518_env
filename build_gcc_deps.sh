#!/bin/bash
# 2015 (c) - Felipe Astroza A.
. common.sh

cd $BUILD &&

tar jxf $SRC/gmp-4.3.2.tar.bz2 &&
cd gmp-4.3.2 &&
./configure --disable-shared --enable-static --prefix=$LIBS_PREFIX --enable-cxx &&
make && make install &&
cd .. &&

tar zxf $SRC/libelf-0.8.13.tar.gz &&
cd libelf-0.8.13 &&
./configure --disable-shared --enable-static --prefix=$LIBS_PREFIX &&
make && make install &&
cd .. &&

tar zxf $SRC/cloog-0.18.1.tar.gz &&
cd cloog-0.18.1 &&
./configure --disable-shared --enable-static --prefix=$LIBS_PREFIX --with-gmp-prefix=$LIBS_PREFIX &&
make && make install &&
cd .. &&

tar zxf $SRC/mpc-0.8.1.tar.gz &&
cd mpc-0.8.1 &&
./configure --disable-shared --enable-static --prefix=$LIBS_PREFIX --with-gmp=$LIBS_PREFIX &&
make && make install &&
cd .. &&

tar jxf $SRC/mpfr-2.4.2.tar.bz2 &&
cd mpfr-2.4.2 &&
./configure --disable-shared --enable-static --prefix=$LIBS_PREFIX --with-gmp=$LIBS_PREFIX &&
make && make install &&
cd .. &&

tar jxf $SRC/binutils-2.25.tar.bz2 &&
mkdir binutils_build &&
cd binutils_build &&
../binutils-2.25/configure --target=$TARGET --prefix=$GCC_ROOT --disable-libmudflap --disable-libssp --disable-libstdcxx-pch --with-arch=$MARCH --enable-lto --with-gmp=$LIBS_PREFIX --with-mpfr=$LIBS_PREFIX --with-ppl=$LIBS_PREFIX --with-cloog=$LIBS_PREFIX --with-libelf=$LIBS_PREFIX --enable-libgomp --enable-poison-system-directories --with-mpc=$LIBS_PREFIX --with-build-sysroot=/opt/hisi-linux-nptl/arm-hisiv100-linux/target --with-sysroot &&
make && make install
