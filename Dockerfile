FROM ubuntu

ARG FILE_TOTAL_SIZE=1024000K
ENV FILE_TOTAL_SIZE="${FILE_TOTAL_SIZE}"

ARG FILE_BLOCK_SIZE=4096K
ENV FILE_BLOCK_SIZE="${FILE_BLOCK_SIZE}"

ARG FILE_NUM=250
ENV FILE_NUM="${FILE_NUM}"

COPY scripts/* /app/

RUN apt-get update && apt-get -y install sysbench
RUN mkdir /sysbench_host && mkdir /sysbench_volume && mkdir /sysbench_container && mkdir /sysbench_image && mkdir /output
RUN /app/create_testdata_image.sh
