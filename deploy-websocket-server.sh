#!/usr/bin/env sh

docker stop sek9-wss

yes | docker system prune

docker run \
  --name sek9-wss \
  --network sek9 \
  --ip 172.20.0.11 \
  --hostname sek9_wss \
  --restart unless-stopped \
  -p 8080:8080 \
  -d lucasblt/websocket-server

yes | docker system prune
