# Due to problems with linux32 gcc, you must first install gcc 4.8.2 onto your root anaconda build.  Then physically copy over the library files
# See http://github.com/conda/conda-recipes/issues/510

# Uncomment the following lines for linux-32
# rm ${PREFIX}/lib/gcc -r
# mkdir $PREFIX/lib/gcc
# cp -r (insert_base_anaconda_path_here)/lib/gcc/* ${PREFIX}/lib/gcc/


export CC=${PREFIX}/bin/gcc
export CXX=${PREFIX}/bin/g++
export F77=${PREFIX}/bin/gfortran
wget -P daspk31 http://www.engineering.ucsb.edu/%7Ecse/Software/daspk31.tgz
make

$PYTHON setup.py daspk install

# Save version number stored in pydas/__init__.py file
$PYTHON -c 'from pydas import __version__; print __version__' > ${SRC_DIR}/__conda_version__.txt
