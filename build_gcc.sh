#!/bin/bash
# 2015 (c) - Felipe Astroza A.
. common.sh

cd $BUILD

tar jxf $SRC/gcc-4.9.2.tar.bz2
mkdir gcc_build
cd gcc_build
../gcc-4.9.2/configure --target=$TARGET --prefix=$GCC_ROOT --enable-threads --disable-libmudflap --disable-libssp --disable-libstdcxx-pch --with-arch=$MARCH --with-gnu-as --with-gnu-ld --enable-languages=c,c++ --enable-shared --enable-lto --enable-symvers=gnu --enable-__cxa_atexit --disable-nls --with-gmp=$LIBS_PREFIX --with-mpfr=$LIBS_PREFIX --with-cloog=$LIBS_PREFIX --with-libelf=$LIBS_PREFIX --with-mpc=$LIBS_PREFIX --with-sysroot=/opt/hisi-linux-nptl/arm-hisiv100-linux/target --with-build-sysroot=/opt/hisi-linux-nptl/arm-hisiv100-linux/target --enable-libgomp --enable-poison-system-directories --disable-libsanitizer
make && make install
