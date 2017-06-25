
deploy: package
	bin/deploy.sh

log:
	bin/dump-logs.sh

invoke:
	bin/invoke.sh

build:
	bin/build.sh

shell:
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free /bin/bash

package:
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free bin/package.sh

test:
	rm -rf /tmp/foo
	mkdir /tmp/foo
	unzip DemoPandas.zip -d /tmp/foo
	cd /tmp/foo ; python3 hello.py
