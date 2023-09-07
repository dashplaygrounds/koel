#!/bin/bash
docker network create koelnet
docker compose up -d
watch docker ps -a
