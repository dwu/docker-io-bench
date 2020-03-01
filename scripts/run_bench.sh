#!/bin/bash

NUM_RUNS=3

cd /sysbench_host
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: host directory... "
    sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 --file-test-mode=rndrw --time=60 fileio run > bench_host_$i.txt
    echo "done"
done

cd /sysbench_volume
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: volume... "
    sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 --file-test-mode=rndrw --time=60 fileio run > bench_volume_$i.txt
    echo "done"
done

cd /sysbench_image
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: image... "
    sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 --file-test-mode=rndrw --time=60 fileio run > bench_image_$i.txt
    echo "done"
done

cd /sysbench_container
echo -n "++ creating test data: in same container "
sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 fileio prepare >/dev/null
echo "done"
for ((i=1;i<=$NUM_RUNS;i++)); do
    echo -n "++ performing test $i: in same container... "
    sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 --file-test-mode=rndrw --time=60 fileio run > bench_container_$i.txt
    echo "done"
done

cp /sysbench_host/*.txt /output
cp /sysbench_volume/*.txt /output
cp /sysbench_image/*.txt /output
cp /sysbench_container/*.txt /output
