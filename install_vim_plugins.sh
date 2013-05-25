#!/bin/bash

cd .vim/bundle
git clone git://github.com/nvie/vim-flake8.git
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/kien/ctrlp.vim.git
git clone git://github.com/majutsushi/tagbar
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/Lokaltog/vim-powerline.git
git clone git://github.com/vim-scripts/YankRing.vim.git
git clone git://github.com/Rip-Rip/clang_complete.git
git clone git://github.com/davidhalter/jedi-vim.git

# update jedi-vim
cd jedi-vim
git submodule update --init
cd ..

cd ../..
