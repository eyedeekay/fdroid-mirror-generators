#! /usr/bin/env bash
FDROID=fdroid-dev
if [ -z "$1" ]; then
    FDROID="$1"
fi
DATE=$(date +%Y%m%d)
cd "$FDROID" && git commit -am "$DATE" && git push
