mkdir -p ~/opt/llvm

# download source (trunk)
cd ~/opt
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm-src

cd ~/opt/llvm-src/tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

cd ~/opt/llvm-src/tools/clang/tools
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra

cd ~/opt/llvm-src/projects
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

# build llvm/clang (release) - enforce using gnu 4.7
cd ~/opt/llvm
CC="gcc-4.7" CXX="g++-4.7" ../llvm-src/configure --enable-optimized --enable-targets=host-only
make -j8 -l75

# install system-wide
sudo make install

# download libc++
# (check also here: http://solarianprogrammer.com/2011/10/16/llvm-clang-libc-linux/)
cd ~/opt
svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
cd ~/opt/libcxx/lib
./buildit
# install (symlink) libc++
cd /usr/lib
sudo ln -sf ~/opt/libcxx/lib/libc++.so.1.0 libc++.so
sudo ln -sf ~/opt/libcxx/lib/libc++.so.1.0 libc++.so.1
cd /usr/include/c++
sudo ln -sf ~/opt/libcxx/include v1

# install scan-build & scan-view
cp -r ~/opt/llvm-src/tools/clang/tools/scan-view ~/opt
cp -r ~/opt/llvm-src/tools/clang/tools/scan-build ~/opt

# cleanup
rm -rf ~/opt/llvm-src
