#!/bin/bash

set -x

IMGTAG="jenkins-master"
PROJECT="local-cicd-demo"

cd ..
docker build -t ${IMGTAG} .
cd -

