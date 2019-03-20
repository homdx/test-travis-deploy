#!/bin/bash

ls -la /bin/sh && whereis sh
alias sh="/cygdrive/c/sh"
echo updated sh
ls -la /bin/sh && whereis sh

DOT_VERSION=0.1.4
DOT_HASH=ffb20ea24176fa417218ac7be269f38d5a1982490585dbfd1750c9afe7d37ded
DOT_PATH=https://github.com/homdx/pydelhi_mobile/releases/download
DOT_FILE=bzip2-1.0.6-3.src.tar.gz

if [ $TRAVIS ]
then
echo "Travis run"
echo root
ls -la /
echo cygdrive
ls -la /cygdrive
echo cygdrive-c
ls -la /cygdrive/c
echo cygdrive-c-Users
ls -la /cygdrive/c/Users
echo cygdrive-c-Users-travis
ls -la /cygdrive/c/Users/travis
echo cygdrive-c-Users-travis-homdx
ls -la /cygdrive/c/Users/travis/homdx
mkdir -p travis/src
cd travis/src
set -ex
time wget --quiet ${DOT_PATH}/${DOT_VERSION}/${DOT_FILE} -O ${DOT_FILE} && \
echo "${DOT_HASH}  ${DOT_FILE}" | sha256sum -c && \
set +ex
tar -xvf ${DOT_FILE} --directory=/usr/src
cd .. && cd ..
else
echo "No travis runing"
fi

echo Check sources
if [ -f  /usr/src/bzip2-1.0.6-3.src/bzip2-1.0.6.tar.gz ]
then
echo found bzip 1.0.6
else
echo not found sources for bzip 1.0.6. You need setup sources or  manual 
compile
exit 255
fi

echo Unpack Sources
cp /usr/src/bzip2-1.0.6-3.src/bzip2-1.0.6.tar.gz .
tar -xf bzip2-1.0.6.tar.gz
rm bzip2-1.0.6.tar.gz

echo Make patches
cd bzip2-1.0.6
cp /usr/src/bzip2-1.0.6-3.src/*.patch .
set -ex
patch Makefile-libbz2_so -p0 <1.0.6-cygwin-dll.patch &&
patch -p0 bzip2recover.c <bzip2-1.0.4-bzip2recover.patch &&
patch -p0 <set-out-file-to-null.patch

echo Compile
make

echo Install
make install

cd ..

echo old path $PATH
export PATH=/usr/local/lib:/usr/local/bin:$PATH
echo new path $PATH
echo detect python
python3 --version
cygcheck -c
echo detect pip version
python3.6 -m pip --version
echo update pip3
python3.6 -m pip install pip --upgrade
echo show upadted pip3 version
python3.6 -m pip --version

git clone --recursive https://github.com/mesonbuild/meson.git
cd meson
python3 setup.py build
python3 setup.py install

cd ..

echo make re2c
git clone --recursive https://github.com/skvadrik/re2c.git
cd re2c/re2c
find . -name \*.m4|xargs dos2unix
find . -name \*.ac|xargs dos2unix
find . -name \*.am|xargs dos2unix
dos2unix autogen.sh
./autogen.sh
echo configure
./configure --help
./configure \
    && echo make && make
echo install
make install
echo done install
cd ..
cd ..

echo make ninja
git clone --recursive https://github.com/ninja-build/ninja
cd ninja
python3 configure.py --verbose
echo status of python3 configure $?
wget https://github.com/ninja-build/ninja/releases/download/v1.9.0/ninja-win.zip
unzip ninja-win.zip
ls -la
chmod +x ninja.exe
echo start build with ninja
./ninja.exe

make
echo status of make ninja $?
meson --version

