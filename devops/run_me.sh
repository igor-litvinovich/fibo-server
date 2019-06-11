#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker run --rm --env 'NODE_ENV=development' -p 8080:8080 -it igorlitv/fibo-server:latest
