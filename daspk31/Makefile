################################################################################
#
#   Makefile for DASPK3.1
#
################################################################################


CFLAGS=-fPIC -fallow-argument-mismatch -O3

DOBJ=solver/adf_dummy.o solver/daux.o solver/ddaskr.o solver/ddaspk.o solver/dlinpk.o solver/dsensd.o solver/mpi_dummy.o

DLIB=libddaspk31.a

.PRECIOUS: solver/%.f

all: $(DLIB)

$(DLIB): $(DOBJ)
	ar rcs $(DLIB) $(DOBJ)

%.o: %.f
	$(F77) $(CFLAGS) -c $< -o $@

solver/%.f: | daspk31.tgz
	tar zxvf daspk31.tgz -C ../

daspk31.tgz:
	./download_daspk31.sh

clean:
	rm -f $(DLIB) $(DOBJ)
