cdef class Subject:
    """Subject in Observer Pattern"""
    def __init__(self):
        self._observers = []

    cpdef attach(self, observer):
        if not observer in self._observers:
            self._observers.append(observer)

    cpdef detach(self, observer):
        try:
            self._observers.remove(observer)
        except ValueError:
            pass

    cpdef notify(self, modifier=None):
        for observer in self._observers:
            if modifier != observer:
                observer.update(self)
