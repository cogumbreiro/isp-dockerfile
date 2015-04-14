FROM ubuntu:14.04
MAINTAINER Tiago Cogumbreiro

RUN sudo apt-get update && \
    mkdir -p /build /home && \
    sudo apt-get install -y \
      unzip wget build-essential libopenmpi-dev openmpi-bin

WORKDIR /build

RUN wget https://github.com/cogumbreiro/isp/archive/master.zip && \
    unzip master.zip

WORKDIR /build/isp-master

RUN ./configure --with-mpi-inc-dir=/usr/include/mpi && \
    make && \
    make install

RUN sudo rm -rf /build

RUN sudo apt-get -y autoremove unzip wget

WORKDIR /home

CMD ["bash"]
