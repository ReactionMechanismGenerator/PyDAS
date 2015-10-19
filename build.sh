export CC=${PREFIX}/bin/gcc
export CXX=${PREFIX}/bin/g++
export F77=${PREFIX}/bin/gfortran
wget -P daspk31 http://www.engineering.ucsb.edu/%7Ecse/Software/daspk31.tgz
make

$PYTHON setup.py daspk install

# Save version number stored in pydas/__init__.py file
$PYTHON -c 'from pydas import __version__; print __version__' > ${SRC_DIR}/__conda_version__.txt
