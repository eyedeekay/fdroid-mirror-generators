#! /usr/bin/env bash
FDROID=fdroid
if [ -z "$1" ]; then
    FDROID="$1"
fi
DATE=$(date +%Y%m%d)
cd "$FDROID" && ./find.sh && git commit -am "$DATE" && git push
