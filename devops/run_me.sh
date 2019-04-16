#!/bin/bash


IMG=`pwd`
TAG=$1
if [ -z ${TAG} ]; then
    read -p "tag: (latest) " response
    TAG=${response:-latest}
fi

docker run --rm \
  --env 'NODE_ENV=development' \
   -p 8080:8080 \
   -it igor-litvinovich/fibo-server:${TAG}
