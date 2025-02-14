#!/bin/sh

cd /tmp
git clone https://github.com/hasse69/rar2fs.git
cd rar2fs
wget https://www.rarlab.com/rar/unrarsrc-7.1.3.tar.gz
tar -xvzf unrarsrc-7.1.3.tar.gz
cd unrar
make lib
make install-lib
make clean
cd ..
autoreconf -f -i
./configure && make
make install
cd /
