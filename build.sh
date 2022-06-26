#! /usr/bin/env sh
VERSION=$(grep I2P_VERSION ../i2p.android.base/gradle.properties)
DATE=$(date +%Y%m%d)

cd ../i2p.i2p && \
    git checkout master; git pull upstream master && \
    ant distclean mavenLocal
echo "${VERSION} ${DATE}"
cd ../i2p.android.base && \
    git checkout master; git pull origin master
if [ -f routerjars/local.properties.bak ]; then
    cp -v routerjars/local.properties routerjars/local.properties.bak
fi
echo "i2psrc=${HOME}/Workspace/GIT_WORK/i2p.i2p" > routerjars/local.properties
./gradlew clean assembleRelease
if [ -f routerjars/local.properties.bak ]; then
    cp -v routerjars/local.properties.bak routerjars/local.properties
fi