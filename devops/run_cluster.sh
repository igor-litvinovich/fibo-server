#!/bin/bash
sudo docker pull igorlitv/fibo-server:latest > /dev/null 2>&1
sudo docker stack deploy -c devops/docker-compose.yml server_name > /dev/null 2>&1
