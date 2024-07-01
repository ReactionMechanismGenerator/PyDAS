################################################################################
#
#   Makefile for DASSL
#
################################################################################


CFLAGS=-fPIC -O3

FFLAGS=-fallow-argument-mismatch

DOBJ=daux.o ddassl.o dlinpk.o

DLIB=libddassl.a

all: $(DLIB)

$(DLIB): $(DOBJ)
	ar rcs $(DLIB) $(DOBJ)

%.o: %.f
	$(F77) $(CFLAGS) $(FFLAGS) -c $< -o $@
	
clean:
	rm -f $(DLIB) $(DOBJ)
