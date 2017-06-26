
An experiment to see if I can run Python packages that depend on native libraries on AWS Lambda.

Primary source of info: https://serverlesscode.com/post/deploy-scikitlearn-on-lamba/

Also helpful: https://alestic.com/2014/11/aws-lambda-cli/

Thanks to Alex Casalboni for pointing me in the right direction :-)
https://www.quora.com/How-do-I-create-a-Python-AWS-Lambda-zip-with-OpenCV-+-FFmpeg/answer/Alex-Casalboni

Update: it is said that the only way to run native libraries in lambda is to compile them on the very same Linux image that Amazon provides.  In the last commit, I proved that it also works with Ubuntu :)  In previous commits, I did the same with the `amazonlinux` image.


## How to use this repo

Check out what the Python code does in `hello/main.py`.  It's basically just creating a Pandas data frame and printing it out.

Create the docker image with `make build`.

Then deploy the lambda function with `make deploy`.  This will create the zip package and create or update the lambda function.

Invoke it with `make invoke`.

Check out the logs with `make log`.  (Though the logs are probably easier to read on the AWS console.)
