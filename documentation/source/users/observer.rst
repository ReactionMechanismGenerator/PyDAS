***************************************
Using Observers or Listeners with PyDAS
***************************************

One can easily extract and store variables from the PyDAS solver class by
writing a Listener or Observer class.  This is helpful if one wishes to store the 
y variable continuously while the solver integrates without having to write
to IO.   For more information on the general usage of Listeners, see 
`Wikipedia: Observer Pattern <https://en.wikipedia.org/wiki/Observer_pattern>`_.

The ``DASPK`` and ``DASSL`` solver classes are a subclass of the ``Subject`` class, which
allows for easy listening of internal variables from the solver. To do so, one needs to create
a Listener class and notify the Listener during the simulation's execution to store that data.

Creating a Listener Class
=========================

Write a separate Listener class that will store the data you are interested in, e.g. YListener.
The Listener class must include an ``update(self,subject)`` function, which is customized
to store the data of interest. ::

    class YListener(object):
        def __init__(self):
            self.data = []
    
        def update(self, subject):
            self.data.append(subject.y)


Client Code
===========

Next, in your client code, create an instance of the listener, 
attach the listener to a solver class which customizes either the
``DASPK`` or ``DASSL`` class, in this case
we have a ``reactionSystem``.  When integrating, one can call the ``notify()`` function,
which automatically updates the Listener and saves the data you are interested in.  

You may detach the Listener when you have finished collecting the data.  Note that
multiple listeners can be attached or detached. ::

    def client_code(...):
        #create a listener instance:
        listener = YListener()
    
        
        reactionSystem.attach(listener)
        while reactionSystem.t < t_end:
            reactionSystem.step()
            reactionSystem.notify() 
    
        #unregister as a listener
        reactionSystem.detach(listener) 