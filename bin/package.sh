#!/bin/bash

set -e

target=/root/work/DemoPandas.zip
stage=/tmp/stage

rm -rf $target $stage

mkdir -p $stage
( cd /opt/venv/lib/python3.6/site-packages; cp -rp scipy numpy $stage )
cp -rp hello $stage


remove=(
    *.*-info **/*.pyc **/__pycache__ **/doc/ **/tests/
    scipy/cluster scipy/constants scipy/fftpack scipy/io scipy/interpolate
    scipy/ndimage scipy/odr scipy/signal scipy/spatial scipy/weave
)
for item in "${remove[@]}"; do
    rm -rf "$stage"/$item
done

cd $stage

echo "Stripping"
find "." -name "*.so" | xargs strip
echo "Zipping"

zip -qr $target *  --exclude="*__pycache__*"


