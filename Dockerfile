FROM centos:centos5
MAINTAINER Jordi Prats

COPY src/ /usr/local/src
COPY scripts/ /usr/local/src/docker-deploy

RUN /bin/bash /usr/local/src/docker-deploy/runmebitch.sh
