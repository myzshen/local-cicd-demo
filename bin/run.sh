#!/bin/bash

set -x

docker run -d \
 --name jenkins-master \
 -p 8080:8080 \
 -p 50000:50000 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v "$HOME":/home \
 jenkins-master

