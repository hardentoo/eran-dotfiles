#!/bin/bash

echo "Remember to run init_system.sh to download, install and configure your system"
echo ""
echo "Installing files..."
echo "Warning - this will override your local configuration. Enter to continue."
read temp

echo "Updating submodules..."
git submodule init
git submodule update

echo "Installing..."
BASEPATH=$PWD
cd ~/
ln -sf $BASEPATH/.bash_aliases
ln -sf $BASEPATH/.bash_exports
ln -sf $BASEPATH/.bash_profile
ln -sf $BASEPATH/.tmux.conf
ln -sf $BASEPATH/.vimrc
ln -sf $BASEPATH/.vim
cp $BASEPATH/.gitconfig ~/
mkdir -p ~/.tmp

echo "Registering your git name/email"
echo -n "[Git] Enter your name: "
read name
echo -n "[Git] Enter your email address: "
read email
git config --global user.name "$name"
git config --global user.email "$email"

