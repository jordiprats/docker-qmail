FROM centos:centos5
MAINTAINER Jordi Prats

#edit HERE
ENV REVERSE_NAME="kellicam.systemadmin.es"
#end

COPY src/ /usr/local/src
COPY scripts/ /usr/local/src/docker-deploy

RUN /bin/bash /usr/local/src/docker-deploy/basecentos5.sh

RUN /bin/bash /usr/local/src/docker-deploy/setup_daemontools.sh

COPY service /service

RUN /bin/bash /usr/local/src/docker-deploy/runmebitch.sh
