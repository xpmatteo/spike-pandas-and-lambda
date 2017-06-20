FROM amazonlinux:latest
RUN yum -y update
RUN yum clean all
RUN yum -y install python35
RUN yum -y install python35-pip
RUN pip-3.5 install Flask
COPY hello.py .
