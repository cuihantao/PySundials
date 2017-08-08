
from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension
import numpy as np
import glob

sundials_lib = "/opt/packages/sundials-2.7.0/bin/lib"
sundials_inc = "/opt/packages/sundials-2.7.0/bin/include"

found_libraries = glob.glob(sundials_lib + '/*.so')

if not found_libraries:
    raise RuntimeError("Cannot find library files for SUNDIALS")
else:
    print("Found the SUNDIALS libraries:")
    for i in found_libraries:
        print(i.split('/')[-1][3:-3])

include_dirs = [sundials_inc, np.get_include(), 'CySundials']
libraries = []
library_dirs = [sundials_lib]
define_macros = []
undef_macros = []
runtime_library_dirs = []
extra_objects = []
extra_compile_args = []
extra_link_args = []
export_symbols = []
depends = []

extensions = [Extension("CySundials.*", ["CySundials/*.pyx"],
                        include_dirs=include_dirs,
                        libraries=libraries,
                        library_dirs=library_dirs,
                        extra_compile_args=extra_compile_args,
                        extra_link_args=extra_link_args
                        ),
              ]

setup(
    name="CySundials",
    description="A lightweight Cython wrapper for the C library SUNDIALS",
    ext_modules=cythonize(extensions)
)
