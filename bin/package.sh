#!/bin/bash

target=/root/work/DemoPandas.zip

rm $target

cd /opt/venv/lib/python3.6/site-packages
zip -r $target * --exclude="*__pycache__*"

cd /root/work
zip -r $target *.py --exclude="*__pycache__*"

