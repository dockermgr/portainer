#!/usr/bin/env bash

APPNAME="portainer-ce"
DOCKER_HUB_URL="portainer/portainer-ce"

sudo mkdir -p "$DATADIR"
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker stop "$APPNAME"
  sudo docker rm -f "$APPNAME"
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else
  sudo docker run -d \
    -p 8000:8000 \
    -p 9010:9000 \
    --restart always \
    --name "$APPNAME" \
    -v "$DATADIR":/data \
    -v /var/run/docker.sock:/var/run/docker.sock \
    "$DOCKER_HUB_URL"
fi
