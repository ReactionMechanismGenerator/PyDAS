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
