#! /usr/bin/env sh

docker run --rm -u $(id -u):$(id -g) -v "$HOME/.local":/.local -v $(pwd):/repo registry.gitlab.com/fdroid/docker-executable-fdroidserver:master