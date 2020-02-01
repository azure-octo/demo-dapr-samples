# vim: noexpandtab: tabstop=4:

FLIBS=flibs-0.9/flibs/src
LIBSQLITE3=$(shell find /usr -name libsqlite3.a -print -quit)

FORTRAN=gfortran
FORTRANFLAGS=-ldl -lfcgi -pthread -Wl,-rpath -Wl,/usr/lib

ifndef $(LIBSQLITE3)
FORTRANFLAGS=-ldl -lfcgi -pthread -Wl,-rpath -Wl,/usr/lib
endif

OBJECTS = \
	jade.o \
	string_helpers.o \
	cgi_protocol.o \
	fcgi_protocol.o

fortran_fcgi: fortran_fcgi.f90 $(OBJECTS)
	$(FORTRAN) -o $@ $^ $(LIBSQLITE3) $(FORTRANFLAGS) 

jade.o: jade.f90 string_helpers.o
	$(FORTRAN) -c $<

string_helpers.o: string_helpers.f90
	$(FORTRAN) -c $<

cgi_protocol.o: $(FLIBS)/cgi/cgi_protocol.f90
	$(FORTRAN) -c $<

fcgi_protocol.o: $(FLIBS)/cgi/fcgi_protocol.f90
	$(FORTRAN) -c $<

clean:
	rm -f -v fortran_fcgi *.o *.mod $(FLIBS)/sqlite/*.o

.PHONY: clean
