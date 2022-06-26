#! /usr/bin/env bash
FDROID=fdroid
if [ -z "$1" ]; then
    echo ""
else
    FDROID="$1"
fi

VERSION=1.8.2

if [ -z "$2" ]; then
    echo "${FDROID} ${VERSION}"
else
    VERSION="$2"
    echo "${FDROID} ${VERSION}"
fi

if [ -z "$3" ]; then
    echo ""
else
    YES="$3"
    echo "${FDROID} ${VERSION} ${YES}"
fi

copy(){
    FDROID="$1"
    cp -v ../i2p.android.base/app/free/release/app-free-release.apk \
        "${FDROID}/repo/I2P-$VERSION.apk"
}

echo "Preparing to copy version $VERSION"
if [ "$YES" != "yes" ]; then
    select yn in "Yes" "No"; do
    case "${yn}" in
        Yes ) copy "${FDROID}"; sleep 2s; break;;
        No ) exit;;
    *) echo "Please answer yes or no."; exit 1;;
    esac
    done
else
    copy "${FDROID}"
fi


cp config.yml "${FDROID}/config.yml"
cd "${FDROID}" && fdroid update && rm config.yml && cd ..

tar --exclude="${FDROID}"/.git --exclude="${FDROID}"/srclibs --exclude="${FDROID}"/tmp --exclude=config.py \
    --exclude="${FDROID}"/repo/tmp --exclude="${FDROID}"/archive/tmp --exclude="${FDROID}.tar.gz" -czvf "./${FDROID}.tar.gz" "${FDROID}"
