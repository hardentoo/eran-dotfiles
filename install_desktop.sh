#!/bin/bash

# Essentials (source control)
sudo apt-get -y install git-gui

# Development (GUIs)
sudo apt-get -y install meld graphviz

# Development (Math)
sudo apt-get -y install octave
sudo apt-get -y install speedcrunch # calculator
## [R language + KDE frontend]
## sudo apt-get -y install r-base rkward

# Filemanager
sudo apt-get -y install gnome-commander

# Wine & VirtualBox
sudo apt-get -y install wine 

# System
sudo apt-get -y install gparted openvpn network-manager-openvpn

# Hebrew
sudo apt-get -y install aspell-he culmus culmus-fancy ttf-mscorefonts

# Fonts
sudo apt-get -y install ttf-liberation

# Browser
sudo apt-get -y install chromium-browser chromium-codecs-ffmpeg-extra

# Remote Desktop
sudo apt-get -y install rdesktop remmina

# Torrents
sudo apt-get -y install qbittorrent

# redshift (red-ish screen color)
sudo apt-get install redshift gtk-redshift
cp redshift.conf ~/.config/

# VirtualBox
sudo apt-get -y install dkms
echo
echo
echo "Download VirtualBox from here: https://www.virtualbox.org/wiki/Linux_Downloads"
echo "Download the All distributions package and run it with sudo"
##read temp

