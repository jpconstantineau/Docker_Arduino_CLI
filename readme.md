# Arduino-CLI Docker Container


Uses the latest Arduino-CLI ![releases](https://img.shields.io/github/v/release/arduino/arduino-cli.svg)

There is a github action that check for new releases every day.

## Using the image

The image is available on [docker hub](https://hub.docker.com/repository/docker/jpconstantineau/arduino-cli/general) and [GitHub Container Registry](https://github.com/jpconstantineau/Docker_Arduino_CLI/pkgs/container/docker_arduino_cli)

This image is built for the following architectures:

* linux/amd64
* linux/arm/v7
* linux/arm64

Note that add-on board support packages may not support all architectures.

To use the docker image, do a docker pull, then you can call the CLI as part of the docker run command.

Note that to see your sketch, the working directory must be mounted in the image.

```
 docker pull ghcr.io/jpconstantineau/docker_arduino_cli:latest

docker run -it --mount src=${PWD},target=/mnt,type=bind  ghcr.io/jpconstantineau/docker_arduino_cli:latest arduino-cli

```


## Building the image yourself

```

 docker build .

```
