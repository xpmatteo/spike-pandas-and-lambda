
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

package: DemoPandas.zip

delete:
	aws lambda delete-function --function-name DemoPandas

DemoPandas.zip: Dockerfile bin/package.sh hello/*
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free bin/package.sh

test: DemoPandas.zip
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free bin/test.sh

.PHONY: deploy log invoke build shell package delete test