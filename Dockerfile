FROM debian:bullseye-slim

LABEL maintainer="docker@marrold.co.uk"

COPY install-opus-tools.sh /opt

RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y tcpreplay libpcap-dev pkg-config libssl-dev && \
    apt-get install -y build-essential file && \
    cd /opt && \
    bash install-opus-tools.sh && \
    apt-get remove -y build-essential && \
    apt-get clean

WORKDIR /opt
CMD bash
