#!/bin/bash
if [ -n "$1" ] && [ -n "$2" ]; then
    git config --global user.name "$1"
    git config --global user.email "$2"
else
    echo "usage: init_git_user.sh name email@host"
fi
