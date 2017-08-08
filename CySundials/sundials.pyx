cimport sundials

cdef extern from "cython_sundials_config.h":
    int PRECISION
    char * SUNDIALS_PACKAGE_VERSION

version = SUNDIALS_PACKAGE_VERSION.decode('utf-8')
print(version)

cdef extern from "sundials/sundials_types.h":
    ctypedef double realtype


