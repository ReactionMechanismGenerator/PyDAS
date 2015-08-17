cdef class Subject:
    
    cdef public object _observers

    cpdef attach(self, object observer)

    cpdef detach(self, object observer)

    cpdef notify(self, object modifier=?)