#!/bin/bash

echo "Parameters:"
echo "  FILE_TOTAL_SIZE=$FILE_TOTAL_SIZE"
echo "  FILE_BLOCK_SIZE=$FILE_BLOCK_SIZE"
echo "  FILE_NUM=$FILE_NUM"

cd /sysbench_image
echo -n "++ creating test data: image... "
sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM fileio prepare >/dev/null
echo "done"
