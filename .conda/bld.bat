:: Instructions for Anaconda build in windows
::
:: First you must install mingwpy for anaconda using the command
::  $ pip install -i https://pypi.anaconda.org/carlkl/simple mingwpy
::
:: You need to create the libpython27.a needed for the gfortran compiler
::
:: In the ~/Anaconda folder, type the following in the command line:
::  $ gendef python27.dll
::  $ dlltool -D python27.dll -d python27.def -l libs/libpython27.a
::
:: Then point distutils to MinGW
::  $ echo -e "[build]\ncompiler=mingw32" > /c/Python27/Lib/distutils/distutils.cfg
::
:: Carrying out these steps will allow you to avoid the Microsoft Visual Studio C++ Compiler
:: and rely solely on GNU MinGW.  This is because it is very difficult to link
:: the necessary gfortran compiler with Visual Studio. 


wget -P daspk31 http://www.engineering.ucsb.edu/~cse/Software/daspk31.tgz
tar zxvf daspk31/daspk31.tgz

cp "%PREFIX%\..\..\libs\libpython27.a" "%PREFIX%\libs\libpython27.a"
cp "%PREFIX%\..\..\Lib\distutils\distutils.cfg" "%PREFIX%\Lib\distutils\distutils.cfg"

cd dassl
mingw32-make
cd ..

cd daspk31
mingw32-make
cd ..

:: Compiling PyDAS...
"%PYTHON%" setup.py build_ext daspk --compiler=mingw32 --inplace

"%PYTHON%" setup.py daspk install


:: Save version number stored in pydas/__init__.py file
"%PYTHON%" -c "from pydas import __version__; print __version__" > "%SRC_DIR%/__conda_version__.txt"
