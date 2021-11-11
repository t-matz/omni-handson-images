FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt-get update -y && \
     apt-get -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev kmod  sudo 

RUN git clone -b v0.4.0 https://github.com/free5gc/gtp5g.git

WORKDIR /workspace/gtp5g

COPY install.sh .

CMD /workspace/gtp5g/install.sh
