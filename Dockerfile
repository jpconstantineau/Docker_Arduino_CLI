FROM ubuntu:latest as downloader
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y bzip2 && rm -rf /var/lib/apt/lists/*
RUN wget https://downloads.arduino.cc/arduino-cli/arduino-cli-latest-linux64.tar.bz2 && tar -xvjf arduino-cli-latest-linux64.tar.bz2 && rm arduino-cli-latest-linux64.tar.bz2
RUN mv arduino-cli-0.3.4-alpha.preview-linux64 arduino-cli


FROM python:slim as arduino-cli
COPY --from=0 /arduino-cli /
COPY .cli-config.yml /
RUN ./arduino-cli core update-index
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


