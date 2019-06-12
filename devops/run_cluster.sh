#!/bin/bash
docker pull igorlitv/fibo-server:latest
docker stack deploy -c devops/docker-compose.yml server_name
