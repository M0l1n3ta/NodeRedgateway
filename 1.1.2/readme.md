

docker build -t sgt/nodered:1.2.3 -f dockerfile.sgt .

##Docker build

docker build --rm --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=12 \
    --build-arg NODE_RED_VERSION=1.2.3 \
    --build-arg OS=alpine \
    --build-arg TAG_SUFFIX=default \
    --file dockerfile.custom \
    --tag sgt/nodered:1.2.3  .



docker build --rm --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=12 \
    --build-arg NODE_RED_VERSION=1.2.3 \
    --build-arg OS=alpine \
    --build-arg TAG_SUFFIX=default \
    --file dockerfile.sgt \
    --tag sgt/nodered:1.2.3  .

docker run -it -p 1880:1880 -v data:/data --name noderedsgt sgt/nodered:1.2.3
docker run -it -p 1880:1880 --name noderedsgt sgt/nodered:1.2.3

docker run -u 0 -it -p 1880:1880 --entrypoint /bin/bash --name noderedsgt sgt/nodered:1.2.3  

##Debug

docker run --rm -d -it mhart/alpine-node:4 /bin/bash

docker run -d -it --entrypoint /bin/bash amd64/node:12-alpine 


docker cp package.json e4c:/usr/src/node-red

