#!/bin/bash

sshpass -p$SSH_PASS ssh -o stricthostkeychecking=no -f -tt $SSH_USER@$SSH_HOST "sudo docker run -d --rm --env 'NODE_ENV=development' -p 8080:8080 igorlitv/fibo-server:latest"
