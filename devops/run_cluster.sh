#!/bin/bash
sudo docker pull igorlitv/fibo-server:latest; \
sudo docker rmi $(sudo docker images -q --filter "dangling=true"); \
sudo docker service rm server_name_fibo-server; \
sudo docker stack deploy -c devops/docker-compose.yml server_name
