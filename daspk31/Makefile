################################################################################
#
#   Makefile for DASPK3.1
#
################################################################################


CFLAGS=-fPIC -O3

FFLAGS=-fallow-argument-mismatch

DOBJ=solver/adf_dummy.o solver/daux.o solver/ddaskr.o solver/ddaspk.o solver/dlinpk.o solver/dsensd.o solver/mpi_dummy.o

DLIB=libddaspk31.a

.PRECIOUS: solver/%.f

all: $(DLIB)

$(DLIB): $(DOBJ)
	ar rcs $(DLIB) $(DOBJ)

%.o: %.f
	$(F77) $(CFLAGS) $(FFLAGS) -c $< -o $@

solver/%.f: | daspk31.tar
	tar zxvf daspk31.tar -C ../

daspk31.tar:
	./download_daspk31.sh

clean:
	rm -f $(DLIB) $(DOBJ)
