#!/bin/bash

# sudo apt install -y postgresql-client-14 -y
# pg_dump --version
# pg_restore --version
mkdir -p ~/pglocal-backups
docker network create koelnet
docker compose up -d
watch docker ps -a
