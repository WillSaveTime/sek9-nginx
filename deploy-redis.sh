#!/usr/bin/env sh

docker stop sek9-redis

yes | docker system prune

docker run \
  --name sek9-redis \
  --network sek9 \
  --ip 172.20.0.10 \
  --hostname sek9_redis \
  --restart unless-stopped \
  -v $PWD/redis/conf:/etc/redis \
  -p 6379:6379 \
  -d redis /etc/redis/redis.conf

yes | docker system prune
