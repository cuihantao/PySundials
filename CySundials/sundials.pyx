cimport sundials

cdef extern from "cython_sundials_config.h":
    int PRECISION
    char * SUNDIALS_PACKAGE_VERSION

cdef extern from "sundials/sundials_types.h":
    ctypedef double realtype

if PRECISION != 2:
    raise Exception("Must recompile CySundials - change precision in file sundials.pyx")



cdef test(realtype a, realtype b):
    return a + b


cdef realtype a, b

a = 2.0
b = 12

print(test(a, b))

print(SUNDIALS_PACKAGE_VERSION)
