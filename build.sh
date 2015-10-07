export CC=${PREFIX}/bin/gcc
export CXX=${PREFIX}/bin/g++
export F77=${PREFIX}/bin/gfortran
wget -P daspk31 http://www.engineering.ucsb.edu/%7Ecse/Software/daspk31.tgz
make
$PYTHON setup.py daspk install
