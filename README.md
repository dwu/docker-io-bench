# Setup

```bash
$ ./build.sh
$ ./create_testdata.sh
```

The following environment variables can be used during image creation where `FILE_TOTAL_SIZE = FILE_BLOCK_SIZE * FILE_NUM`.

```bash
$ FILE_TOTAL_SIZE=4096000K FILE_BLOCK_SIZE=4096K FILE_NUM=1000 ./build.sh
```

# Run

```bash
$ ./run_bench.sh
```

Output is placed in `output/`.

View results with `grep -A 2 Throughput output/*`.
