wget -P daspk31 http://www.engineering.ucsb.edu/~cse/Software/daspk31.tgz
mingw32-make


%PYTHON% setup.py daspk install

:: Save version number stored in pydas/__init__.py file
%PYTHON% -c "from pydas import __version__; print __version__" > %SRC_DIR%/__conda_version__.txt