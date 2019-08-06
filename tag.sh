#!/bin/sh

VERSION=$(grep -e "ARG YOUTUBE_DL_VERSION=" Dockerfile)
VERSION=${VERSION#ARG YOUTUBE_DL_VERSION=\"}
VERSION=${VERSION%\"}
echo "Tagging version ${VERSION}"
docker tag "${DOCKER_USERNAME}/youtube-dl:latest" "${DOCKER_USERNAME}/youtube-dl:${VERSION}"
docker tag "${DOCKER_USERNAME}/youtube-dl:latest" "${DOCKER_USERNAME}/youtube-dl:master"
