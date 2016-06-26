FROM ubuntu:14.04
# Forked from https://github.com/pierophp/dockers: "Piero Giusti <pierophp@gmail.com>"

MAINTAINER "AJ NOURI <ajn.bin@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Upgrade
RUN apt-get update && \
    apt-get upgrade -y && \

# NFS Server
RUN apt-get install -y nfs-kernel-server

# Supervisor
RUN apt-get install -y supervisor

# Tools
RUN apt-get install -y vim wget curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /export/docker
#RUN mount --bind /docker /export/docker

ADD nfs-run.sh /usr/local/bin/nfs-run
ADD nfs/exports /etc/exports

RUN exportfs -a

RUN chmod +x /usr/local/bin/nfs-run

ADD supervisor/* /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisor/supervisord.conf"]
