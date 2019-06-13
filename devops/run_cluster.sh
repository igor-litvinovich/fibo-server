#!/bin/bash
sudo docker pull igorlitv/fibo-server:latest
sudo docker stack deploy -c devops/docker-compose.yml server_name
