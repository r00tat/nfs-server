FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        netbase \
        nfs-kernel-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /exports

VOLUME /exports

EXPOSE 111/udp 2049/tcp

ADD nfs.sh /usr/local/sbin/nfs.sh
ENTRYPOINT ["/usr/local/sbin/nfs.sh"]
