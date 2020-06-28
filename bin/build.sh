#!/bin/bash

set -x

IMGTAG=“jenkins-master”
PROJECT="local-cicd-demo"

docker build -t ${IMGTAG} -f ~/home/${PROJECT}/Dockerfile

