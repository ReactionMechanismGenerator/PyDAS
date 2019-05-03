# Download DASPK 3.1
wget -P daspk31 https://sites.engineering.ucsb.edu/~cse/Software/daspk31.tgz

# Compile solvers
make

# Build cython wrapper
$PYTHON setup.py daspk install

