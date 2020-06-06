FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget
RUN apt-get install -y qemu-user-static

RUN cd /tmp && \ 
    wget http://cdimage.ubuntu.com/ubuntu-base/releases/16.04/release/ubuntu-base-16.04-core-amd64.tar.gz
    


# COPY inittab /tmp/overlay/etc/inittab
COPY interfaces /tmp/overlay/etc/network/interfaces
# COPY start.sh /tmp/overlay/start.sh
COPY resolv.conf  /tmp/overlay/etc/resolv.conf
COPY builder /builder
CMD ["/bin/bash", "/builder"]