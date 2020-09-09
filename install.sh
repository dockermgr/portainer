#!/usr/bin/env bash

APPNAME="portainer-ce"
DATADIR="/srv/docker/$APPNAME"

mkdir -p "$DATADIR" && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
docker stop "$APPNAME"
docker rm -f "$APPNAME"
docker pull portainer/portainer-ce
fi
docker run -d \
-p 127.0.0.1:8000:8000 \
-p 127.0.0.1:9010:9000 \
--restart always \
--name "$APPNAME" \
-v $DATADIR:/data \
-v /var/run/docker.sock:/var/run/docker.sock \
portainer/portainer-ce
