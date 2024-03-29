.. warning::
    PyDAS is currently abandonware. The ReactionMechanismGenerator
    organization no longer has developers capable of maintaining it.

    The usage documentation is still relevant but no new updates will be
    released and we are unable to fix any bugs.

    We will continue to release conda packages for PyDAS as long as possible.
    The current version (as of 5/2/2023) was built with libgfortran-ng 12 (or just libgfortran 5 for Mac) and
    Python 3.7 - it is likely in the future that this will no longer work properly
    and need to be fixed.

    To build PyDAS, clone this repository, install the dependencies (find them
    with conda search -c rmg PyDAS), upgrade whichever are causing problems,
    then navigate to the .conda directory and run "conda build ."

    Good Luck,
    Jackson (@JacksonBurns)

*************************************************************************
PyDAS - A Python wrapper to several differential algebraic system solvers
*************************************************************************

For the full documentation, please view the PDF found in the
``documentation`` folder. Or download it directly 
`here <https://github.com/ReactionMechanismGenerator/PyDAS/raw/master/documentation/PyDAS_Documentation.pdf>`_.

Introduction
============

PyDAS provides a means for Python code to utilize several notable Fortran-based
differential algebraic system solvers from Python code. The solvers made
available -- DASSL and DASKR -- are all publicly-available from 
`Netlib <http://www.netlib.org/ode/>`_, and are distributed with PyDAS. PyDAS
provides a Python extension type for each solver, which in turn provides a
Pythonic means of setting the solver options, providing residual and jacobian
functions, and running the solver.

In addition, PyDAS also provides a wrapper to the DASPK3.1 solver, which
has native sensitivity analysis. The source code for DASPK3.1 is subject to
copyright restrictions but is available for research purposes. Due to these
restrictions, it is up to the user to download these source files manually 
(or agree to download them during the prompt given when compiling the wrappers).
Please see the README file inside the daspk31/ folder for more details.  

The DASSL, DASPK, and DASKR solvers are all substantially more robust than
VODE, the solver used within the ODE solver functionality provided by 
`SciPy <http://www.scipy.org/>`_.

License
=======

Copyright (c) 2010-2015 by Joshua W. Allen (joshua.w.allen@gmail.com),
Connie W. Gao (connie.w.gao@gmail.com) and the Reaction Mechanism 
Generator Team (rmg_dev@mit.edu).

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the 'Software'),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

Dependencies
============

PyDAS has been tested on Python versions 2.5 and 2.6. It may or may not work
for other Python versions.

There are several Python dependencies that you must install before installing 
PyDAS:

* `Python <http://www.python.org/>`_ (versions 2.5.x and 2.6.x are known to work)

* `NumPy <http://numpy.scipy.org/>`_ (version 1.3.0 or later is recommended)

* `Cython <http://www.cython.org/>`_ (version 0.12.1 or later is recommended)

In addition, you will also need a Fortran compiler and a C compiler that
produce object files that can interoperate. The ``gfortran`` and ``gcc`` 
compiles from the GNU Compiler Collection are known to work. On Windows the
`MinGW <http://www.mingw.org/>`_ compiler collection provides these compilers.

The code for the differential algebraic system solvers DASSL, DASPK, and DASKR
has been provided with the PyDAS package. The licenses for these solvers is
different than that of the PyDAS wrapper code. **You are responsible for knowing
and abiding by all licenses associated with each solver as well as with PyDAS
as a whole.**

Installation
============

.. note:: 

    Currently only the DASSL and DASPK3.1 solvers have been wrapped. 
    The installation scripts build and install the DASSL wrapper and the
    DASPK wrapper (unless the DASPK3.1 fortran code was not compiled.)
    

Installing PyDAS binary package via Anaconda (Recommended)
----------------------------------------------------------

**Now available for Linux, Mac OSX, and Windows Users**

If you wish to use PyDAS out of the box, you can now install it as a binary package using the Anaconda platform.  
PyDAS can now be installed in binary format using the Anaconda Python Platform.
This is recommended for a basic user who will not be altering the source code of PyDAS or who is
less familiar with Unix-based systems.

* Download and install the `Anaconda Python Platform <http://continuum.io/downloads>`_. When prompted to append Anaconda to your PATH, select or type Yes.

* Install PyDAS binary.  Dependencies will be installed automatically.  Type the following into your Terminal to do so ::

    conda install -c rmg -y pydas

* You may now run a PyDAS test job. Save the `Batch Reactor Reaction Series Script <https://github.com/ReactionMechanismGenerator/PyDAS/blob/master/examples/rxnSeries/rxnSeries.py>`_  
  to a local directory.  Use the Terminal to run the script inside that folder using the following command ::

    python rxnSeries.py

You can now import any functions inside the PyDAS package directly from Python or your own scripts.


Windows
-------

The provided make.bat batch script will compile the DASSL solver and the PyDAS
wrapper code. Use the make_daspk.bat script to compile the DASPK3.1 solver and the
DASPK wrapper code.  Make sure you have manually downloaded the DASPK3.1 source
files into the daspk31 folder.  See the daspk31/README file for more details.
These scripts presume that you have the 32-bit version of the
MinGW C and Fortran compilers installed. Once you have run the batch script,
you can install PyDAS into your Python packages if you desire by running the
following command from the base package directory:

    > python setup.py install

Use the following command if you want to install both the DASSL and DASPK wrappers:

    > python setup.py daspk install 

Linux
-----

A Makefile has been provided that can be used to compile the DASSL solver and
DASSL wrapper code. To use, invoke the following command from the
base package directory::

    $ make

This command will build PyDAS in-place, rather than installing it to your
Python package directory.

If you wish to formally install PyDAS, run the
following command from the base package directory after the ``make`` command
(you may need root privileges for this)::

    $ make install

You may wish to write a file `make.inc` that sets certain variables used by
the Makefiles (e.g. the Fortran compiler). An example of such a file, 
`make.inc.example`, has been provided.



Mac OS X
--------

Homebrew (http://brew.sh) is an easy way to get gfortran::

    $ brew install gcc

But your system may still not be able to find the correct `libgfortran.a` library file
(see https://github.com/mxcl/homebrew/issues/8539 ). Also, there are some problems
linking with `clang`, so you need to make it link with `gcc`. This should
build and install, assuming you have NumPy, Cython, etc. all set up::

    $ export LIBRARY_PATH=$(dirname $(gfortran -print-file-name=libgfortran.a))
    $ make
    $ make install

Although at one stage it also required ``LDSHARED='gcc -bundle -undefined dynamic_lookup -arch x86_64'``.
It seems to keep on changing. If you have difficulty, check the
`issue tracker <https://github.com/ReactionMechanismGenerator/PyDAS/issues/>`_, and if you solve
your difficulty, please share your successful approach.
