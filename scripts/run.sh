#!/bin/bash

set -x

IMAGE_NAME="jenkins-master"
CONTAINER_NAME="jenkins-master"

docker run -d \
 --name ${CONTAINER_NAME} \
 -p 8080:8080 \
 -p 50000:50000 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v "$HOME":/home \
 ${IMAGE_NAME}

