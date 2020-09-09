#!/usr/bin/env bash

mkdir -p /srv/docker/portainer && chmod -Rf 777 /srv/docker/portainer

docker run -d -p 127.0.0.1:9010:9000 \
--restart always \
--name portainer \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /srv/docker/portainer:/data \
portainer/portainer-ce
