#!/bin/bash

cd /sysbench_host
echo "++ creating test data: host directory..."
sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 fileio prepare >/dev/null
echo "++ done"

cd /sysbench_volume
echo "++ creating test data: volume"
sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 fileio prepare >/dev/null
echo "++ done"
