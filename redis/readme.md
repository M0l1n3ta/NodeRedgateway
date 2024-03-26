

## Docker build
docker build -t molineta/redis .

docker build -t molineta/redis -f dockerfile.custom .
docker build -t molineta/redis -f dockerfile.prometheus .

## Ejecutar Contenedor

docker run --rm -it -p 6379:6379 molineta/redis

docker run -d -p 6379:6379 --name redis-server molineta/redis

## Debug container

docker run --rm -it -p 6379:6379 molineta/redis /bin/bash

## RedisJson
docker run -d -p 6379:6379 --name redis-rejson redislabs/rejson:latest