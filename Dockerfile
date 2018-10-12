FROM ubuntu:precise

MAINTAINER Criztian Haunsen <cristianhaunsen@gmail.com>

RUN apt-get update && apt-get install -y \
    bison \
    wget \
    build-essential \
    libxml2-dev \
    libssl-dev
RUN  wget --no-check-certificate https://redmine.kannel.org/attachments/download/321/gateway-1.4.5.tar.bz2
RUN tar jxvf gateway-1.4.5.tar.bz2
WORKDIR gateway-1.4.5
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel
RUN touch .depend
RUN make
RUN make install
WORKDIR /
RUN rm gateway-1.4.5.tar.bz2
RUN rm -Rf gateway-1.4.5
RUN mkdir -p /var/log/kannel
RUN mkdir -p /var/spool/kannel

VOLUME /etc/kannel
VOLUME /var/log/kannel
VOLUME /var/spool/kannel
WORKDIR /usr/sbin
