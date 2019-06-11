#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

sudo docker pull igorlitv/fibo-server:latest && sudo docker run -d --rm --env 'NODE_ENV=development' -p 8080:8080 igorlitv/fibo-server:latest