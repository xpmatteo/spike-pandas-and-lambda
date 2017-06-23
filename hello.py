import os
from flask import Flask
app = Flask(__name__)


BUILD_NUMBER='__NO_BUILD_NUMBER__'
BUILD_BRANCH='__UNKNOWN_BRANCH__'

@app.route("/")
def hello():
    return "Hello World from {} {}:{}!".format(os.environ['PIPPO'], BUILD_BRANCH, BUILD_NUMBER)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
