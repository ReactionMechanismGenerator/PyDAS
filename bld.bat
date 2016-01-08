wget -P daspk31 http://www.engineering.ucsb.edu/~cse/Software/daspk31.tgz
tar zxvf daspk31/daspk31.tgz
::mingw32-make

::gfortran -O3 -c dassl/daux.f -o dassl/daux.o
::gfortran -O3 -c dassl/ddassl.f -o dassl/ddassl.o
::gfortran -O3 -c dassl/dlinpk.f -o dassl/dlinpk.o
::ar rcs dassl/libddassl.a dassl/daux.o dassl/ddassl.o dassl/dlinpk.o
::echo "PREFIX"
cp "%PREFIX%\..\..\libs\libpython27.a" "%PREFIX%\libs\libpython27.a"


cd dassl
mingw32-make
cd ..

cd daspk31
mingw32-make
cd ..

::echo Compiling PyDAS...
"%PYTHON%" setup.py build_ext daspk --compiler=mingw32 --inplace
"%PYTHON%" setup.py daspk install

::%PYTHON% setup.py daspk install

:: Save version number stored in pydas/__init__.py file
"%PYTHON%" -c "from pydas import __version__; print __version__" > "%SRC_DIR%/__conda_version__.txt"
