#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

TAG=$1
if [[ -z ${TAG} ]]; then
    TAG="${TRAVIS_TAG:-latest}"
fi

docker push igorlitv/fibo-server:${TAG}
