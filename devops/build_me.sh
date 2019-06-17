#!/bin/bash

TAG=$1
if [[ -z ${TAG} ]]; then
    TAG="${TRAVIS_TAG:-latest}"
fi

docker build -t igorlitv/fibo-server:${TAG} .
