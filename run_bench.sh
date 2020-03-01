#!/bin/bash

docker run -v $PWD/output:/output -v $PWD/sysbench_host:/sysbench_host -v docker-io-bench-volume:/sysbench_volume --ulimit nofile=100000:100000 docker-io-bench /app/run_bench.sh
