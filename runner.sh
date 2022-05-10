#!/usr/bin/env sh

docker stop sek9-nginx

yes | docker system prune

docker build --no-cache -t sek9-nginx .

docker run --name sek9-nginx --network sek9 --ip 172.20.0.2 --hostname nginx -p 80:80 -v $PWD/nginx/conf.d:/etc/nginx/conf.d:ro -d sek9-nginx
# docker run --name sek9-nginx --network bridge --hostname nginx  -p 80:80 -d sek9-nginx

yes | docker system prune


