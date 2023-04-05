

## Docker build
docker build -t sgt/redis .

docker build -t sgt/redis -f dockerfile.custom .
docker build -t sgt/redis -f dockerfile.prometheus .

## Ejecutar Contenedor

docker run --rm -it -p 6379:6379 sgt/redis

docker run -d -p 6379:6379 --name redis-server sgt/redis

## Debug container

docker run --rm -it -p 6379:6379 sgt/redis /bin/bash

## RedisJson
docker run -d -p 6379:6379 --name redis-rejson redislabs/rejson:latest