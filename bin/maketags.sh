#!/bin/bash
#ctags -R -f ~/.vim/tags/python27.ctags /usr/lib/python2.7/
cd /usr/include && sudo ctags -R .
cd /usr/lib/python2.7 && sudo ctags -R .
