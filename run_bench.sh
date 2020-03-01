#!/bin/bash

docker run -v $PWD/output:/output -v $PWD/sysbench_host:/sysbench_host -v docker-io-bench-volume:/sysbench_volume docker-io-bench /app/run_bench.sh
