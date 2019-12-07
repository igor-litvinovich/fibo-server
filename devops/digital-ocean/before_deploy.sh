#!/bin/bash
openssl aes-256-cbc -K $encrypted_bf7b528e85e7_key -iv $encrypted_bf7b528e85e7_iv -in travis_deploy_key.pem.enc -out travis_deploy_key.pem -d
chmod 600 ./travis_deploy_key.pem
ssh-add ./travis_deploy_key.pem

scp -i ./travis_deploy_key.pem -o StrictHostKeyChecking=no -rp ./devops $SSH_USER@$SSH_HOST:/$SSH_USER
ssh -i ./travis_deploy_key.pem -o StrictHostKeyChecking=no -tt  $SSH_USER@$SSH_HOST "chmod +rwx ./devops/run_cluster.sh && 
                    echo \"$DOCKER_PASSWORD\" | docker login -u \"$DOCKER_USERNAME\" --password-stdin"