#!/bin/bash
openssl aes-256-cbc -K $encrypted_2f6baf9ce98a_key -iv $encrypted_2f6baf9ce98a_iv -in travis_deploy_key.pem.enc -out travis_deploy_key.pem -d
chmod 600 ./travis_key
ssh-add ./travis_key

scp -i travis_key -o StrictHostKeyChecking=no -rp ./devops $SSH_USER@$SSH_HOST:/$SSH_USER
ssh -i travis_key -o StrictHostKeyChecking=no -tt  $SSH_USER@$SSH_HOST "chmod +rwx ./devops/run_cluster.sh && 
                    echo \"$DOCKER_PASSWORD\" | docker login -u \"$DOCKER_USERNAME\" --password-stdin"