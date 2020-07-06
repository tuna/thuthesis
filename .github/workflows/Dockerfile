FROM debian:buster
MAINTAINER Shengqi Chen <shengqi.chen@tuna.tsinghua.cn>

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
    apt-get install -f -y --no-install-recommends ca-certificates curl fontconfig make &&\
    update-ca-certificates &&\
    apt-get clean -y &&\
    rm -rf /var/lib/apt/lists/*

COPY install-texlive.sh texlive.profile /tmp
RUN /tmp/install-texlive.sh

ENV PATH="/opt/texlive/bin/x86_64-linux:${PATH}"
