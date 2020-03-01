#!/bin/bash

docker build -t docker-io-bench .

if $(docker volume ls | grep -q docker-io-bench-volume); then
    echo "++ volume docker-io-bench-volume exists, exiting..."
    exit 1
fi
echo -n "++ creating new volume... "
docker volume create docker-io-bench-volume
echon "done"
