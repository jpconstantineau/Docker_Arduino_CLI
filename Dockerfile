<<<<<<< HEAD
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



=======
FROM ubuntu:latest as downloader
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y bzip2 && rm -rf /var/lib/apt/lists/*
RUN wget https://downloads.arduino.cc/arduino-cli/arduino-cli-latest-linux64.tar.bz2 && tar -xvjf arduino-cli-latest-linux64.tar.bz2 && rm arduino-cli-latest-linux64.tar.bz2
RUN mv arduino-cli-0.3.6-alpha.preview-linux64 arduino-cli


FROM python:slim as arduino-cli
COPY --from=0 /arduino-cli /
COPY .cli-config.yml /
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /root
ENV USER root
RUN /arduino-cli core update-index --debug



>>>>>>> bd45699627a2db1e88056f7e559514ba63680c9c
