#!/bin/bash

set -x

IMAGE_NAME="jenkins-master"

cd ..
docker build -t ${IMAGE_NAME} .
cd -

