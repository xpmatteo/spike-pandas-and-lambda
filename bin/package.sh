#!/bin/bash

target=/root/work/DemoPandas.zip

rm $target

cd /opt/venv/lib/python3.6/site-packages
zip -r $target \
  numpy \
  pandas \
  sqlalchemy \
  requests \
  mysqlclient \
  boto3 \
  bitstring \
  scikit-learn \
  peakutils \
  pandas \
  xlrd \
  nose-parameterized \
  pymc3   \
  pytz \
  dateutil \
  six.py \
  --exclude="*__pycache__*"

cd /root/work
zip -r $target hello --exclude="*__pycache__*"

