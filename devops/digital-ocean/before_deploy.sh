#!/bin/bash
openssl aes-256-cbc -K $encrypted_962bc74ba9d3_key -iv $encrypted_962bc74ba9d3_iv -in travis_key.enc -out travis_key -d
chmod 600 ./travis_key
ssh-add ./travis_key

scp -i travis_key -o StrictHostKeyChecking=no -rp ./devops $SSH_USER@$SSH_HOST:/$SSH_USER
ssh -i travis_key -o StrictHostKeyChecking=no -tt  $SSH_USER@$SSH_HOST "chmod +rwx ./devops/run_cluster.sh && 
                    echo \"$DOCKER_PASSWORD\" | docker login -u \"$DOCKER_USERNAME\" --password-stdin"