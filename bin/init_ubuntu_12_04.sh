#!/bin/bash
cd $HOME
mkdir bin
mkdir opt

# Essentials (source control)
sudo apt-get install git-core git-gui git-doc git-flow mercurial

# Development (IDE)
sudo apt-get install spyder

# Development (Math)
sudo apt-get install octave3.2
sudo apt-get install r-base rkward
sudo apt-get install gsl-bin

# Development (general)
sudo apt-get install gcc colorgcc autoconf
sudo apt-get install cmake
sudo apt-get install scons

# Development (gcc-4.7)
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.7 c++-4.7

# Development (debug)
sudo apt-get install strace ddd valgrind

# Development (other/misc/interesting)
sudo apt-get install flex bison
#sudo apt-get install speedcrunch # calculator

# Development (GUIs)
sudo apt-get install meld graphviz
#sudo apt-get install dia

# Other
sudo apt-get install screen tmux

# VIM
sudo apt-get install vim # system availability - we will use our own compiled version in $(HOME)/bin
sudo apt-get install ctags xclip

# Python related
sudo apt-get install ipython python-scipy python-numpy python-matplotlib python-gnuplot
sudo apt-get install python-nose python-coverage
sudo apt-get install python-setuptools
sudo apt-get install python-pip
sudo easy_install rednose
sudo pip install interval
#sudo easy_install virtualenv
#sudo pip install virtualenvwrapper
#export WORKON_HOME=~/Envs
#mkdir -p $WORKON_HOME
#source /usr/local/bin/virtualenvwrapper.sh
# The following is already in my .bashrc in mbrochh-dotfiles
# echo "export WORKON_HOME=~/Envs" >> .bashrc
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> .bashrc

# Global Python modules
#sudo pip install configobj
#sudo pip install ipdb
sudo pip install watchdog

# Install autojump
cd $HOME/opt
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.sh
cd $HOME/bin
ln -s ../.autojump/bin/autojump j
cd $HOME

# Install vim
sudo apt-get build-dep vim
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
cd $HOME
rm -r -f vim

# Install Google's Protocol Buffers
sudo apt-get install libprotobuf-dev protobuf-compiler python-protobuf

# Install MongoDB (and related python modules)
sudo apt-get install mongodb python-pymongo # mongodb-server

# Install Boost v1.48
#sudo apt-get install libboost-dev # usually this installs v1.46
sudo apt-get remove libboost1.46-all-dev # just in case
sudo apt-get install libboost1.48-all-dev
sudo apt-get install libboost-python-dev

# Needed?
#sudo apt-get install libpcre3 libpcre3-dev # unknown
#sudo apt-get install gtk2-engines-pixbuf # vim related?

