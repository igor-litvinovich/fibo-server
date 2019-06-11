#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin "https://cloud.docker.com/repository/docker/igorlitv/fibo-server"

docker push igorlitv/fibo-server:latest