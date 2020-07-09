FROM ubuntu:latest as downloader
RUN apt-get update && apt-get install -y wget bzip2 curl && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh

FROM python:slim as arduino-cli
COPY --from=0 /usr/local/bin/arduino-cli /usr/local/bin/arduino-cli
COPY .cli-config.yml /
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /root
ENV USER root
ENV ARDUINO_DATA_DIR=/opt/arduino
RUN arduino-cli core update-index --verbose



