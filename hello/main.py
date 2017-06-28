import os, sys
import datetime

import os
import ctypes
for d, dirs, files in os.walk('lib'):
    for f in files:
        if f.endswith('.so'):
            ctypes.cdll.LoadLibrary(os.path.join(d, f))


from scipy.sparse.linalg import lsqr as sparse_lsqr
