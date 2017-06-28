#!/bin/bash

set -e

target=/root/work/DemoPandas.zip
stage=/tmp/stage

rm -rf $target $stage

mkdir -p $stage
pip3.6 install -t $stage numpy
pip3.6 install -t $stage scipy
cp -rp hello $stage

cd $stage
echo "Stripping"
find "." -name "*.so" | grep -v linalg | xargs strip
echo "Zipping"
zip -qr $target *  --exclude="*__pycache__*"


