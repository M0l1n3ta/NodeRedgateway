
## Docker build
docker build -t molineta/nodered:1.2.3 -f dockerfile.custom .
docker build -t molineta/nodered:1.2.3 .


## Docker Run
docker run -d -p --name node-red 1890:1880 nodered/node-red-docker


docker commit --pause 204 molineta/sgt-nodered

docker run -d -p 1890:1880 --link redis-server sgt/nodered:1.2.3


docker run -d --entrypoint "/bin/bash" -p 1890:1880 nodered/node-red-docker

## Docker compose

docker-compose up

## Restart Default Flows
docker cp scripts/flows.json node-sgtvs_nodered_1:/data/flows.json


## We restart Node-RED
docker-compose restart node-sgtvs_nodered_1


## Instalar Certificado sin autofirma

docker cp 

## grafana
docker run --rm  -p 6000:3000 grafana/grafana
