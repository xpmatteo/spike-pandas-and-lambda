FROM amazonlinux:latest
RUN yum -y update
RUN yum clean all

# install python
RUN yum -y install make automake gcc gcc-c++ kernel-devel
RUN yum -y install zlib-devel bzip2-devel openssl-devel readline-devel ncurses-devel sqlite-devel
RUN curl --remote-name --progress https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz && \
  echo '2d0fc9f3a5940707590e07f03ecb08b9 Python-3.6.1.tgz' | md5sum -c -
RUN tar zxf Python-3.6.1.tgz
RUN cd Python-3.6.1 && ./configure --prefix=/usr/local --enable-shared && make && make altinstall
RUN echo '/usr/local/lib' > /etc/ld.so.conf.d/local-libs.conf
RUN ldconfig
RUN cd .. && rm -rf Python-3.6.1.tgz Python-3.6.1

# needed for packaging the lambda
RUN yum install -y zip

# needed for testing the lambda package
RUN yum install -y unzip

# utilities for interactive use
RUN yum -y install vim less which

# add manpages
RUN yum install -y man-pages man

RUN echo 'alias l="ls -la"' >> ~/.bashrc

# create our virtual env
RUN /usr/local/bin/python3.6 -m venv /opt/venv
RUN /opt/venv/bin/pip install numpy

RUN yum -y install blas
RUN yum -y install lapack
RUN yum -y install atlas-sse3-devel
RUN yum -y install Cython
RUN yum -y install gcc-gfortran libgfortran

RUN /opt/venv/bin/pip install --no-binary :all: scipy

# utilities for testing
RUN yum -y install diffutils

RUN mkdir /root/work
WORKDIR /root/work
