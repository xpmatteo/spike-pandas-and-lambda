
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

delete:
	aws lambda delete-function --function-name DemoPandas
