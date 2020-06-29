#!/bin/sh

DOCKER_VERSION=19.03.12

sudo yum update -y 
sudo yum install -y make yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.13-3.2.el7.x86_64.rpm
sudo yum install -y docker-ce-${DOCKER_VERSION} docker-ce-cli-${DOCKER_VERSION}
sudo usermod -aG docker ${USER}
sudo systemctl start docker && sudo systemctl enable docker
sudo setenforce 0
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux

# this is ONLY to faciliate local test, not recommended to any online environment
sudo chmod 666 /var/run/docker.sock

