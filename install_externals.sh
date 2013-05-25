#!/bin/bash

# Install autojump
cd $HOME/opt
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.sh
cd $HOME/bin
ln -s ../.autojump/bin/autojump j
cd $HOME

# Install vim
cd /tmp
hg clone https://code.google.com/p/vim/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
cd $HOME
rm -r -f vim

# Install Python (based on Anaconda)
cd /tmp
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.5.0-Linux-x86_64.sh
bash Anaconda-1.5.0-Linux-x86_64.sh -b
cd $HOME/anaconda/bin
pip install rednose
pip install watchdog
#pip install interval
cd $HOME

