#!/bin/bash

cd /sysbench_image
echo -n "++ creating test data: image... "
sysbench --file-total-size=1024000K --file-block-size=4096K --file-num=250 fileio prepare >/dev/null
echo "done"
