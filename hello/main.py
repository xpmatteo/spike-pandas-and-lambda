import os, sys
import datetime

import os
import ctypes
for d, dirs, files in os.walk('lib'):
    for f in files:
        if f.endswith('.so'):
            ctypes.cdll.LoadLibrary(os.path.join(d, f))


import numpy
import pandas as pd

def hello_handler(event, context):
    m = pd.DataFrame({'foo': [1,2,3,4,5]})
    return {
        'message': str(m),
    }

if __name__ == '__main__':
    print(hello_handler({}, None))
