#!/bin/sh

docker run -v $PWD/output:/output -v $PWD/sysbench_host:/sysbench_host -v docker-io-bench-volume:/sysbench_volume docker-io-bench /app/create_testdata_host_and_volume.sh
