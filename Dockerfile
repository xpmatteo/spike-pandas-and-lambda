FROM amazonlinux:latest
RUN yum -y update
RUN yum clean all
RUN yum -y install make automake gcc gcc-c++ kernel-devel
RUN yum -y install python35
RUN yum -y install python35-pip
RUN yum -y install python35-devel
RUN yum -y install python35-virtualenv
RUN yum -y install zip

RUN virtualenv-3.5 /opt/venv
RUN /opt/venv/bin/pip install pandas

RUN mkdir /root/work
WORKDIR /root/work


# WORKDIR /opt/venv/lib/python3.5/site-packages
# RUN zip -r9 ~/sample-lambda.zip *
#
# RUN mkdir /root/work
# RUN zip -r9 ~/sample-lambda.zip *.py
#
