#!/bin/bash

NUM_RUNS=${NUM_RUNS:-5}

echo "Parameters:"
echo "  FILE_TOTAL_SIZE=$FILE_TOTAL_SIZE"
echo "  FILE_BLOCK_SIZE=$FILE_BLOCK_SIZE"
echo "  FILE_NUM=$FILE_NUM"
echo "  NUM_RUNS=$NUM_RUNS"

cd /sysbench_host
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: host directory... "
    sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM --file-test-mode=rndrw --time=60 fileio run >bench_host_$i.txt
    echo "done"
done

cd /sysbench_volume
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: volume... "
    sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM --file-test-mode=rndrw --time=60 fileio run >bench_volume_$i.txt
    echo "done"
done

cd /sysbench_image
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: image... "
    sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM --file-test-mode=rndrw --time=60 fileio run >bench_image_$i.txt
    echo "done"
done

cd /sysbench_container
echo -n "++ creating test data: in same container "
sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM fileio prepare >/dev/null
echo "done"
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: in same container... "
    sysbench --file-total-size=$FILE_TOTAL_SIZE --file-block-size=$FILE_BLOCK_SIZE --file-num=$FILE_NUM --file-test-mode=rndrw --time=60 fileio run >bench_container_$i.txt
    echo "done"
done

cp /sysbench_host/*.txt /output
cp /sysbench_volume/*.txt /output
cp /sysbench_image/*.txt /output
cp /sysbench_container/*.txt /output
