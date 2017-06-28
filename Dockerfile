FROM ubuntu:latest
RUN apt-get update
#RUN apt-get -y upgrade

# install python
RUN apt-get install -y build-essential
RUN apt-get install -y curl libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN curl --remote-name --progress https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz && \
  echo '2d0fc9f3a5940707590e07f03ecb08b9 Python-3.6.1.tgz' | md5sum -c -
RUN tar zxf Python-3.6.1.tgz
RUN cd Python-3.6.1 && ./configure --prefix=/usr/local --enable-shared && make && make altinstall
RUN echo '/usr/local/lib' > /etc/ld.so.conf.d/local-libs.conf
RUN ldconfig
RUN cd .. && rm -rf Python-3.6.1.tgz Python-3.6.1

# needed for packaging the lambda
RUN apt-get install -y zip

# utilities for interactive use
#RUN yum -y install vim less which
RUN echo 'alias l="ls -la"' >> ~/.bashrc

# create our virtual env
RUN /usr/local/bin/python3.6 -m venv /opt/venv
RUN /opt/venv/bin/pip install numpy
RUN /opt/venv/bin/pip install scipy
# RUN /opt/venv/bin/pip install sqlalchemy
# RUN /opt/venv/bin/pip install requests
# RUN apt-get install -y mysql-client  libmysqlclient-dev
# RUN /opt/venv/bin/pip install mysqlclient
# RUN /opt/venv/bin/pip install boto3
# RUN /opt/venv/bin/pip install bitstring
# RUN /opt/venv/bin/pip install 'scikit-learn>=0.18'
# RUN /opt/venv/bin/pip install peakutils
# RUN /opt/venv/bin/pip install 'pandas>=0.19'
# RUN /opt/venv/bin/pip install xlrd
# RUN /opt/venv/bin/pip install nose-parameterized
# RUN /opt/venv/bin/pip install 'pymc3==3.0'

RUN mkdir /root/work
WORKDIR /root/work
