#!/bin/sh

DOCKER_VERSION=19.03.12

sudo yum update -y && \
sudo yum install -y make yum-utils && \
sudo yum-config-manager --add-repo \
	https://download.docker.com/linux/centos/docker-ce.repo && \
sudo yum install -y docker-ce-${DOCKER_VERSION} docker-ce-cli-${DOCKER_VERSION} && \
sudo usermod -aG docker ${USER} && \
newgrp docker && \
# this is ONLY to faciliate local test, not recommended to any online environment
sudo chmod 666 /var/run/docker.sock

