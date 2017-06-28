#!/bin/bash

set -e

target=/tmp/package
actual=/tmp/actual
expected=/tmp/expected

rm -rf $target $actual $expected


echo -n "Unzipping; compressed size: "
ls -lh DemoPandas.zip | awk '{ print $5}'
unzip -d $target -q DemoPandas.zip
echo -n "Unzipped size: "
du -sh $target | awk '{ print $1}'

cd $target

cat > $expected <<EOF
EOF

python3.6 > $actual <<EOF
from scipy.sparse.linalg import lsqr as sparse_lsqr
EOF

diff $expected $actual

echo "OK"