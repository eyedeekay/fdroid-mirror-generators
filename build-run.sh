#! /usr/bin/env sh
RUNDIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
echo "${RUNDIR}"
./build.sh || exit 1
cd "${RUNDIR}" || exit 1
./run.sh fdroid-dev || exit 1
cd "${RUNDIR}" || exit 1
exit 0