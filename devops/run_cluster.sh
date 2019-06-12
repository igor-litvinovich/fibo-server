#!/bin/bash
docker-compose pull
docker stack deploy -c devops/docker-compose.yml server_name
