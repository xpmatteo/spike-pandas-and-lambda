#!/bin/bash

# WORKDIR /opt/venv/lib/python3.5/site-packages
# RUN zip -r9 ~/sample-lambda.zip *
#
# RUN mkdir /root/work
# RUN zip -r9 ~/sample-lambda.zip *.py

target=/root/work/sample-lambda.zip

cd /opt/venv/lib/python3.5/site-packages
zip -r9 $target *

cd /root/work
zip -r9 $target *.py
