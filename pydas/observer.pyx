cdef class Subject:
    """Subject in Observer Pattern"""
    def __init__(self):
        self._observers = []

    """
    Call this method when your (self-implemented)
    observer class should start listening to the Subject
    class.

    e.g.:

    listener = YourOwnListener()
    subject.attach(listener)
    """
    cpdef attach(self, observer):
        if not observer in self._observers:
            self._observers.append(observer)


    """
    Call this method when your (self-implemented)
    observer class should stop listening to the Subject
    class.

    e.g.:
    listener = YourOwnListener()
    subject.attach(listener)

    ...<do some work>...

    subject.detach(listener)

    """
    cpdef detach(self, observer):
        try:
            self._observers.remove(observer)
        except ValueError:
            pass

    """
    Call this method in classes that implement
    Subject, when the data that your interested in,
    is available.

    e.g.:
    class ReactionSystem(...):
        ...
        def simulate(...)
            <stuff is being done>

            self.notify()

            <continue doing other stuff>            


    Make sure that your listener class implements the update(subject)
    method!

    e.g.:

    class YourOwnListener(object):
        def __init__(self):
            self.data = []

        def update(self, subject):
            self.data.append(subject.data)

    """
    cpdef notify(self, modifier=None):
        for observer in self._observers:
            if modifier != observer:
                observer.update(self)
