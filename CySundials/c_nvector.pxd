from c_sundials cimport *

cdef extern from "nvector/nvector_serial.h":
    struct _N_VectorContent_Serial:
        long int length
        booleantype own_data
        realtype *data
    ctypedef _N_VectorContentSerial *N_VectorContentSerial
    N_Vector N_VNew_Serial(long int vec_length)
    N_Vector N_VNewEmpty_Serial(long int vec_length)
    N_Vector N_VMake_Serial(long int vec_length, realtype *v_data)
    N_Vector *N_VCloneVectorArray_Serial(int count, N_Vector w)
    N_Vector *N_VCloneVectorArrayEmpty_Serial(int count, N_Vector w)
    void N_VDestroyVectorArray_Serial(N_Vector *vs, int count)
    long int N_VGetLength_Serial(N_Vector v)
    void N_VPrint_Serial(N_Vector v)


cdef extern from "nvector/nvector_openmp.h":
    struct _N_VectorContent_OpenMP:
    long int length
    booleantype own_data
    realtype *data
    int num_threads
        N_Vector N_VNew_OpenMP(long int vec_length, int num_threads);
    N_Vector N_VNewEmpty_OpenMP(long int vec_length, int num_threads);
    N_Vector N_VMake_OpenMP(long int vec_length, realtype *v_data, int num_threads);
    N_Vector *N_VCloneVectorArray_OpenMP(int count, N_Vector w);
    N_Vector *N_VCloneVectorArrayEmpty_OpenMP(int count, N_Vector w);
    void N_VDestroyVectorArray_OpenMP(N_Vector *vs, int count);
    long int N_VGetLength_OpenMP(N_Vector v);
    void N_VPrint_OpenMP(N_Vector v);