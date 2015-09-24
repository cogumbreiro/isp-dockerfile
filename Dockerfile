FROM phusion/baseimage:0.9.17
MAINTAINER Tiago Cogumbreiro

RUN sudo apt-get update && \
    mkdir -p /build /home && \
    sudo apt-get install -y \
      unzip \
      wget \
      build-essential \
      libopenmpi-dev \
      openmpi-bin \
      && \
    ( \
        cd /build && \
        wget https://github.com/cogumbreiro/isp/archive/master.zip && \
        unzip master.zip && \
        rm master.zip \
    ) && \
    sudo apt-get -y autoremove unzip wget && \
    ( \
        cd /build/isp-master && \
        ./configure --with-mpi-inc-dir=/usr/include/mpi && \
        make && \
        make install && \
        rm -rf /build \
    ) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /home

VOLUME /home

CMD ["bash"]
