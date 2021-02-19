# Arduino-CLI Docker Container


Uses the latest Arduino-CLI ![releases](https://img.shields.io/github/v/release/arduino/arduino-cli.svg)

There is a github action that check for new releases every day.

## Using the image

The image is available on [docker hub](https://hub.docker.com/repository/docker/jpconstantineau/arduino-cli/general). 

To use the docker image, do a docker pull, then you can call the CLI as part of the docker run command.

Note that to see your sketch, the working directory must be mounted in the image.

```
docker pull jpconstantineau/arduino-cli

docker run -it --mount src=${PWD},target=/mnt,type=bind  jpconstantineau/arduino-cli:latest arduino-cli

```


## Building the image yourself

```

 docker build .

```
