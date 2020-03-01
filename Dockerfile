FROM ubuntu

COPY scripts/* /app/

RUN apt-get update && apt-get -y install sysbench
RUN mkdir /sysbench_host && mkdir /sysbench_volume && mkdir /sysbench_container && mkdir /sysbench_image && mkdir /output
RUN /app/create_testdata_image.sh
