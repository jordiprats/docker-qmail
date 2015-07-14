FROM centos:centos5
MAINTAINER Jordi Prats "jprats@systemadmin.es"

COPY src/ /usr/local/src

RUN yum install -y gcc gcc-c++ make wget curl libtermcap-devel mysql55


