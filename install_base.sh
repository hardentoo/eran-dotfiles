#!/bin/bash
cd $HOME
mkdir bin
mkdir opt

# Essentials (source control)
sudo apt-get -y install git-core git-doc git-flow mercurial subversion 
sudo apt-get -y install tig

# Development (Math)
sudo apt-get -y install gsl-bin

# Development (general)
sudo apt-get -y install g++ cpp
sudo apt-get -y install gcc colorgcc autoconf
sudo apt-get -y install cmake scons

# Development (debuging)
sudo apt-get -y install strace ddd valgrind

# Screen Multiplexers
sudo apt-get -y install screen tmux

# VIM
sudo apt-get -y build-dep vim
sudo apt-get -y install libncurses5-dev # needed to build vim from source
sudo apt-get -y install vim # system availability - we will use our own compiled version in $(HOME)/bin
sudo apt-get -y install exuberant-ctags cscope xclip

# Install Boost v1.50
#sudo apt-get -y install libboost-dev # usually this installs v1.46
sudo apt-get -y remove libboost1.46-all-dev # just in case
sudo apt-get -y remove libboost1.47-all-dev # just in case
sudo apt-get -y remove libboost1.48-all-dev # just in case
sudo apt-get -y remove libboost1.49-all-dev # just in case
sudo apt-get -y install libboost1.50-all-dev
#sudo apt-get -y install libboost-python-dev

# Install Google's Protocol Buffers
## sudo apt-get -y install libprotobuf-dev protobuf-compiler python-protobuf

# Install MongoDB (and related python modules)
## sudo apt-get -y install mongodb python-pymongo # mongodb-server

# Python related (will be installed through Anaconda)
#sudo apt-get -y install ipython python-scipy python-numpy python-matplotlib python-gnuplot
#sudo apt-get -y install ipython-notebook ipython-qtconsole
#sudo apt-get -y install python-nose python-coverage
#sudo apt-get -y install python-setuptools
#sudo apt-get -y install python-pip
#sudo pip install rednose
#sudo pip install interval
#sudo pip install configobj
#sudo pip install ipdb
#sudo pip install watchdog

# Python virtualenv
#sudo easy_install virtualenv
#sudo pip install virtualenvwrapper
#export WORKON_HOME=~/Envs
#mkdir -p $WORKON_HOME
#source /usr/local/bin/virtualenvwrapper.sh
# The following is already in my .bashrc in mbrochh-dotfiles
# echo "export WORKON_HOME=~/Envs" >> .bashrc
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> .bashrc
