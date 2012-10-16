#!/bin/bash
cd $HOME
mkdir bin
mkdir opt

# Essentials (source control)
sudo apt-get -y install git-core git-gui git-doc git-flow mercurial subversion

# Development (IDE)
sudo apt-get -y install spyder

# Development (Math)
sudo apt-get -y install octave3.2
sudo apt-get -y install r-base rkward
sudo apt-get -y install gsl-bin

# Development (general)
sudo apt-get -y install gcc colorgcc autoconf
sudo apt-get -y install cmake
sudo apt-get -y install scons

# Development (gcc-4.7)
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get -y update
sudo apt-get -y install g++-4.7 c++-4.7

# Development (debug)
sudo apt-get -y install strace ddd valgrind

# Development (other/misc/interesting)
sudo apt-get -y install flex bison
#sudo apt-get -y install speedcrunch # calculator

# Development (GUIs)
sudo apt-get -y install meld graphviz
#sudo apt-get -y install dia

# Other
sudo apt-get -y install screen tmux

# VIM
sudo apt-get -y install vim # system availability - we will use our own compiled version in $(HOME)/bin
sudo apt-get -y install ctags xclip
sudo apt-get -y install libclang-dev

# Python related
sudo apt-get -y install ipython python-scipy python-numpy python-matplotlib python-gnuplot
sudo apt-get -y install python-nose python-coverage
sudo apt-get -y install python-setuptools
sudo apt-get -y install python-pip
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
sudo apt-get -y build-dep vim
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
sudo apt-get -y install libprotobuf-dev protobuf-compiler python-protobuf

# Install MongoDB (and related python modules)
sudo apt-get -y install mongodb python-pymongo # mongodb-server

# Install Boost v1.48
#sudo apt-get -y install libboost-dev # usually this installs v1.46
sudo apt-get -y remove libboost1.46-all-dev # just in case
sudo apt-get -y install libboost1.48-all-dev
sudo apt-get -y install libboost-python-dev

# Needed?
#sudo apt-get -y install libpcre3 libpcre3-dev # unknown
#sudo apt-get -y install gtk2-engines-pixbuf # vim related?

