#!/bin/sh 
wget https://www.rarlab.com/rar/unrarsrc-7.0.8.tar.gz -P /tmp/
tar -xvzf /tmp/unrarsrc-7.0.8.tar.gz -C /tmp
make lib -j$(($(nproc) + 1)) -l$(($(nproc) + 2)) -C /tmp/unrar
make install-lib -C /tmp/unrar -f /tmp/unrar/makefile
make clean -j$(($(nproc) + 1)) -l$(($(nproc) + 2)) -C /tmp/unrar -f /tmp/unrar/makefile
make -j$(($(nproc) + 1)) -l$(($(nproc) + 2)) -C /tmp/unrar -f /tmp/unrar/makefile
make install -C /tmp/unrar
rm -rf -v /tmp/unrar{-7.0.8.tar.gz}

git clone https://github.com/hasse69/rar2fs.git /tmp/rar2fs
cd /tmp/rar2fs
autoreconf -f -i
./configure
make -j$(($(nproc)+1)) -l$(($(nproc)+2)) -C /tmp/rar2fs
make install -C /tmp/rar2fs
