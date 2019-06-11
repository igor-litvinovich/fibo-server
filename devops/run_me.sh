#!/bin/bash

docker run --rm \
  --env 'NODE_ENV=development' \
  --env 'DB_HOST=host.docker.internal' \
   -p 8080:8080 \
   -it igorlitv/fibo-server:latest
