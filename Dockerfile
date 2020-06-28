FROM jenkins/jenkins:lts-centos7

RUN mkdir ${JENKINS_HOME}/casc_configs
COPY ./jenkins.yaml ${JENKINS_HOME}/casc_configs/jenkins.yaml

ARG DOCKER_VERSION=19.03.12

ENV CASC_JENKINS_CONFIG=${JENKINS_HOME}/casc_configs
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

RUN install-plugins.sh \
  git \
  docker \
  configuration-as-code \
  blueocean \
  job-dsl \
  matrix-auth \
  cloudbees-folder \
  workflow-aggregator \
  pipeline-utility-steps \
  generic-webhook-trigger \
  git-changelog 

COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

USER root

# Install the latest Docker CE binaries and add user `jenkins` to the docker group
RUN yum update -y && \
    yum install -y yum-utils && \
    yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce-${DOCKER_VERSION} docker-ce-cli-${DOCKER_VERSION} && \ 
    usermod -aG docker jenkins

# drop back to the regular jenkins user
USER jenkins

VOLUME /var/jenkins_home

