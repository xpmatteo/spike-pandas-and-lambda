import os, sys
import datetime

import os
import ctypes
for d, dirs, files in os.walk('lib'):
    for f in files:
        if f.endswith('.so'):
            ctypes.cdll.LoadLibrary(os.path.join(d, f))


import numpy

def hello_handler(event, context):
    t = str(datetime.datetime.now())
    # m = pd.DataFrame({'foo': [1,2,3,4,5]})
    # print(t, event, str(m))
    return {
        'time': t,
        'message': 'OK :-)',
    }


if __name__ == '__main__':
    print(hello_handler({}, None))
