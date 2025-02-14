#!/bin/sh

cd /tmp
git clone https://github.com/fdegros/rar2fs.git
cd rar2fs
wget https://www.rarlab.com/rar/unrarsrc-6.0.7.tar.gz
tar -xvzf unrarsrc-6.0.7.tar.gz
cd unrar
make lib
make install-lib
cd ..
autoreconf -f -i
./configure && make
make install
cd /
