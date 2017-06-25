
deploy: create-package
	bin/deploy.sh

build:
	bin/build.sh

shell:
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free /bin/bash

create-package:
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root/work mv-free bin/create-package.sh
