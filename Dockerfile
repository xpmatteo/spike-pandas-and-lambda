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

RUN yum -y install zip

RUN /usr/local/bin/python3.6 -m venv /opt/venv
RUN /opt/venv/bin/pip install numpy

# utilities for interactive use
RUN yum -y install vim less which
RUN echo 'alias l="ls -la"' >> ~/.bashrc

RUN mkdir /root/work
WORKDIR /root/work
