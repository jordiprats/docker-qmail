FROM centos:centos5
MAINTAINER Jordi Prats

COPY src/ /usr/local/src
COPY scripts/ /usr/local/src/docker-deploy

RUN /usr/local/src/docker-deploy/runmebitch.sh
