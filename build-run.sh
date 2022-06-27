#! /usr/bin/env sh

sudo update-java-alternatives --set java-1.8.0-openjdk-amd64

if [ -z "$1" ]; then
    FDROID=fdroid-dev
else
    FDROID="$1"
fi

RUNDIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
echo "${RUNDIR}"
./build.sh || exit 1
cd "${RUNDIR}" || exit 1
DATE=$(date +%Y%m%d)
./run.sh "${FDROID}" "${DATE}" yes || exit 1
cd "${RUNDIR}" || exit 1
./github.sh "${FDROID}" || exit 1
exit 0