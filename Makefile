################################################################################
#
#   Makefile for PyDAS
#
################################################################################


CYTHON_FLAGS=--inplace

-include make.inc

.PHONY: DASSL DASPK31 DASKR cython clean 

all: DASSL DASPK31 DASKR cython

dassl: DASSL cython

daspk: DASPK31 cython

cython:
	pip install .

install: DASSL DASPK31 DASKR cython
	pip install .

test: 
	cd tests; python dasslTest.py
	cd tests; python daspkTest.py

DASSL:
	$(MAKE) -C dassl F77=$(F77)

DASPK31:
	$(MAKE) -C daspk31 F77=$(F77)

DASKR:
	$(MAKE) -C daskr F77=$(F77)

clean: clean-DASSL clean-DASPK31 clean-DASKR clean-cython
	rm -rf build

clean-DASSL:
	$(MAKE) -C dassl clean

clean-DASPK31:
	$(MAKE) -C daspk31 clean

clean-DASKR:
	$(MAKE) -C daskr clean

clean-cython:
	python setup.py clean $(CLEAN_FLAGS)
	rm -f pydas/*.so pydas/*.pyc pydas/*.c pydas/*.html

help:
	@echo ""
	@echo "This makefile can be used to build PyDAS and its dependencies."
	@echo ""
	@echo "Typing \`make\` with no arguments will compile all three DAE solvers (DASSL,"
	@echo "DASPK3.1, and DASKR) to static libraries and compile the PyDAS Python modules"
	@echo "that provide the Python interface to these solvers. Note that one must agree"
	@echo "to download the DASPK3.1 source code externally to compile the DASPK wrapper."
	@echo ""
	@echo "Typing \`make clean\` will delete all of the intermediate build files,"
	@echo "compiled libraries, and compiled Python modules for all three DAE solvers and"
	@echo "the PyDAS modules."
	@echo ""
	@echo "Individual dependencies can be specified using \`make <target>\`, where"
	@echo "<target> is one of:"
	@echo ""
	@echo "    DASSL    to compile the DASSL solver"
	@echo "    DASPK31    to compile the DASPK31 solver"   
	@echo "    DASKR    to compile the DASKR solver"
	@echo "    cython   to compile the PyDAS Python wrapper module for DASSL"
	@echo "             and DASPK3.1 (if it was compiled)"
	@echo ""

