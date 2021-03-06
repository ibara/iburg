# This Makefile written by Brian Callahan <bcallah@devio.us>
# and released into the Public Domain.

PREFIX?=/usr/local

CC?=	cc
CFLAGS?=-O2 -pipe

YACC?=	yacc
YFLAGS=

PROG=	iburg
OBJS=	iburg.o gram.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install: all
	install -d ${PREFIX}/bin
	install -d ${PREFIX}/man/man1
	install -c -s -m 555 ${PROG} ${PREFIX}/bin
	install -c -m 444 iburg.1 ${PREFIX}/man/man1/${PROG}.1

test: all
	./${PROG} -I sample4.brg sample4.c; ${CC} -o test4 sample4.c; ./test4
	./${PROG} -I sample5.brg sample5.c; ${CC} -o test5 sample5.c; ./test5

clean:
	rm -f ${PROG} ${OBJS} sample4.c sample5.c test4 test5 *.core
