#!/bin/bash
echo "Running release $TAG"
wget -qO- https://toolbelt.heroku.com/install.sh | sh && \
echo 'PATH="/usr/local/heroku/bin:$PATH"' >> ~/.profile \
docker login --username="$HEROKU_USERNAME" --password=$(heroku auth:token) registry.heroku.com && \
docker tag igorlitv/fibo-server:"$TAG" registry.heroku.com/"$HEROKU_APP_NAME"/web && \
docker push registry.heroku.com/"$HEROKU_APP_NAME"/web && \
heroku container:release web --app "$HEROKU_APP_NAME"
