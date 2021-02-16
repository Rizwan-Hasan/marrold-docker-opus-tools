FROM debian:buster-slim

LABEL maintainer="docker@marrold.co.uk"

COPY install-opus-tools.sh /opt

RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y tcpreplay libpcap-dev pkg-config libssl-dev build-essential && \
    cd /opt && \
    bash install-opus-tools.sh && \
    apt-get remove -y build-essential

WORKDIR /opt
CMD bash
