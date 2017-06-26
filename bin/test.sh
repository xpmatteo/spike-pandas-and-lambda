#!/bin/bash

target=/tmp/package
actual=/tmp/actual
expected=/tmp/expected

rm -tf $target $actual $expected

unzip -d $target DemoPandas.zip

cd $target

cat > $expected <<EOF
{'message': '   foo\n0    1\n1    2\n2    3\n3    4\n4    5'}
EOF

python3.6 > $actual <<EOF
import hello.main

print(hello.main.hello_handler({}, None))
EOF

diff $expected $actual