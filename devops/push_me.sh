#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin "https://cloud.docker.com/repository/registry-1.docker.io"

docker push igorlitv/fibo-server:latest