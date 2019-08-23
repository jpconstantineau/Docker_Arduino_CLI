FROM ubuntu:latest as downloader
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y bzip2 && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y  curl && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/bin  sh



FROM python:slim as arduino-cli
COPY --from=0 /bin/arduino-cli /
COPY .cli-config.yml /
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /root
ENV USER root
RUN /arduino-cli core update-index --debug



