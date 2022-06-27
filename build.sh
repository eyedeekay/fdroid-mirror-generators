#! /usr/bin/env sh
. ../i2p.android.base/gradle.properties
DATE=$(date +%Y%m%d)

cd ../i2p.i2p && \
    git checkout master; git pull --all && \
    ant distclean mavenLocal
    ./installer/resources/maven-dev-release.sh 1
echo "${I2P_VERSION} ${DATE}"
sleep 20s
cd ../i2p.android.base && \
    git checkout master; git pull origin master
sed -i.bak "s/I2P_VERSION=.*/I2P_VERSION=${I2P_VERSION}-1/g" gradle.properties
if [ -f routerjars/local.properties.bak ]; then
    cp -v routerjars/local.properties routerjars/local.properties.bak
fi
echo "i2psrc=${HOME}/Workspace/GIT_WORK/i2p.i2p" > routerjars/local.properties
./gradlew clean assembleRelease
if [ -f routerjars/local.properties.bak ]; then
    cp -v routerjars/local.properties.bak routerjars/local.properties
fi
cp -v gradle.properties.bak gradle.properties