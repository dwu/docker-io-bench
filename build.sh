#!/bin/bash

FILE_TOTAL_SIZE=${FILE_TOTAL_SIZE:-1024000K}
FILE_BLOCK_SIZE=${FILE_BLOCK_SIZE:-4096K}
FILE_NUM=${FILE_NUM:-250}

docker build -t docker-io-bench --build-arg FILE_TOTAL_SIZE=$FILE_TOTAL_SIZE --build-arg FILE_BLOCK_SIZE=$FILE_BLOCK_SIZE --build-arg FILE_NUM=$FILE_NUM .

if $(docker volume ls | grep -q docker-io-bench-volume); then
    echo "++ volume docker-io-bench-volume exists, exiting..."
    exit 1
fi
echo -n "++ creating new volume... "
docker volume create docker-io-bench-volume
echo "done"
