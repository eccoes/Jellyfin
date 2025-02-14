#!/bin/sh

cd /tmp
wget https://www.rarlab.com/rar/unrarsrc-7.1.3.tar.gz
tar -xvzf unrarsrc-7.1.3.tar.gz
cd unrar
make lib
make install-lib
make clean
./configure && make
make install
cd /

git clone https://github.com/hasse69/rar2fs.git -C /tmp/rar2fs
cd /tmp/rar2fs
autoreconf -f -i
./configure --with-unrar=/tmp/unrar
make 
make install
