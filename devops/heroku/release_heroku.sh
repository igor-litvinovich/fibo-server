#!/bin/bash

docker login --username="$HEROKU_USERNAME" --password=$(heroku auth:token) registry.heroku.com && \
docker tag igorlitv/fibo-server:"$TRAVIS_TAG" registry.heroku.com/"$HEROKU_APP_NAME"/web && \
docker push registry.heroku.com/"$HEROKU_APP_NAME"/web
