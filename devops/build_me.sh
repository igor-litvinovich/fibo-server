#!/bin/bash

TAG=$1
if [[ -z ${TAG} ]]; then
    TAG="${TRAVIS_TAG:-latest}"
fi
echo "Building with tag:${TAG}"

docker build -t igorlitv/fibo-server:${TAG} .
