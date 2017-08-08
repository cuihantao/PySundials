cimport c_sundials
from c_sundials cimport realtype, booleantype, PRECISION, SUNDIALS_PACKAGE_VERSION

version = SUNDIALS_PACKAGE_VERSION.decode('utf-8')


cdef test(realtype a, realtype b):
    return a + b


cdef realtype a, b

a = 2.0
b = 12

print(test(a, b))