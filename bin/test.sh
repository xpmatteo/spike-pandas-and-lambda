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
{'message': '   foo\n0    1\n1    2\n2    3\n3    4\n4    5'}
EOF

python3.6 > $actual <<EOF
import hello.main

print(hello.main.hello_handler({}, None))
EOF

diff $expected $actual

echo "OK"