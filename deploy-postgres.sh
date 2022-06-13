#!/usr/bin/env sh

docker stopsek9-postgres

yes | docker system prune

docker run \
  --name sek9-postgres \
  --network=sek9 \
  --ip 172.20.0.4 \
  --hostname sek9_postgres \
  --restart unless-stopped \
  -p 5432:5432 \
  -e POSTGRES_DB=sek9 \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres123qwe!@#QWE \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -v $PWD/postgres-data:/var/lib/postgresql/data \
  -d postgres

yes | docker system prune
