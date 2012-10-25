#!/bin/bash

# install CMake 2.8.9
cd /tmp
wget http://www.cmake.org/files/v2.8/cmake-2.8.9.tar.gz
tar -xzf cmake-2.8.9.tar.gz
cd cmake-2.8.9
./configure
make
sudo make install
cd $HOME

# Install autojump
cd $HOME/opt
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.sh
cd $HOME/bin
ln -s ../.autojump/bin/autojump j
cd $HOME

# Install vim
hg clone https://code.google.com/p/vim/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
cd $HOME
rm -r -f vim

