#!/usr/bin/env sh

docker stop sek9-nginx

yes | docker system prune

docker network create \
  --driver=bridge \
  --subnet=172.20.0.0/16 \
  --ip-range=172.20.0.0/16 \
  --gateway=172.20.0.1\
  sek9

docker run \
  --name sek9-nginx \
  --network=sek9 \
  --ip 172.20.0.2 \
  --hostname nginx \
  --restart unless-stopped \
  -p 80:80 \
  -p 443:443 \
  -v $PWD/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $PWD/nginx/conf.d:/etc/nginx/conf.d:ro \
  -v $PWD/certs:/etc/nginx/certs:ro \
  -v $PWD/validation:/etc/nginx/validation:ro \
  -v $PWD/build:/var/www/html:rw \
  -d nginx:alpine

yes | docker system prune
