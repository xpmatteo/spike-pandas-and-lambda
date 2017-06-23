
build:
	bin/build.sh

shell:
	docker run -ti -v /Users/mvaccari/work/pirelli/spike-lambda:/root mv-free /bin/bash

push:
	bash -c "eval $(aws ecr get-login --no-include-email --region us-east-1)"
	docker push 576273734969.dkr.ecr.us-east-1.amazonaws.com/mv-free:latest
	docker tag mv-free:latest 576273734969.dkr.ecr.us-east-1.amazonaws.com/mv-free:latest

run:
	docker run -p 5000:5000 mv-free:latest

test:
	docker run mv-free:latest python35 -m unittest discover