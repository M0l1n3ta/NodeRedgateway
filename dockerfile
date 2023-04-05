# Dockerfile for Node-RED - pulls latest master code from git
FROM node:16-slim

RUN mkdir -p /data
WORKDIR /data
 
# download latest stable node-red
RUN npm install -g --unsafe-perm node-red


# use external storage for the user directory
COPY config/* /data

RUN apt-get update && apt-get install -y nano tzdata && \
    cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD ["node-red","-u","/data"]

# docker build --rm=true --tag=node-red .
# docker run -it -p 1880:1880 --name mynodered node-red 
# docker run -it -p 1880:1880 -v ./data:/data--name mynodered node-red