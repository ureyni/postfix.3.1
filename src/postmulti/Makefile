# Do not edit -- this file documents how Postfix was built for your machine.
#----------------------------------------------------------------
# Start of summary of user-configurable 'make makefiles' options.
# CCARGS=
# AUXLIBS=
# shared=
# dynamicmaps=
# pie=
# End of summary of user-configurable 'make makefiles' options.
#--------------------------------------------------------------
# System-dependent settings and compiler/linker overrides.
SYSTYPE	= LINUX4
_AR	= ar
ARFL	= rv
_RANLIB	= ranlib
SYSLIBS	= -lpcre -ldb -lnsl -lresolv -ldl -Wl,-z,relro -lpthread -ldl -lm -L/usr/lib64 -licui18n -licuuc -licudata -lpthread -ldl -lm 
CC	= gcc -I. -I../../include -D_REENTRANT -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -I/usr/include -DHAS_PCRE -DSNAPSHOT -UUSE_DYNAMIC_LIBS -DDEF_SHLIB_DIR=\"no\" -UUSE_DYNAMIC_MAPS $(WARN)
OPT	= -O
DEBUG	= -g
AWK	= awk
STRCASE = 
EXPORT	= CCARGS='-I. -I../../include -D_REENTRANT -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -I/usr/include -DHAS_PCRE -DSNAPSHOT -UUSE_DYNAMIC_LIBS -DDEF_SHLIB_DIR=\"no\" -UUSE_DYNAMIC_MAPS' OPT='-O' DEBUG='-g'
WARN	= -Wall -Wno-comment -Wformat -Wimplicit -Wmissing-prototypes \
	-Wparentheses -Wstrict-prototypes -Wswitch -Wuninitialized \
	-Wunused -Wno-missing-braces
DEFINED_MAP_TYPES = pcre
MAKE_FIX = 
# Switch between Postfix static and dynamically-linked libraries.
AR	= ar
RANLIB	= ranlib
LIB_PREFIX = 
LIB_SUFFIX = .a
SHLIB_CFLAGS = 
SHLIB_DIR = no
SHLIB_ENV = 
SHLIB_LD = :
SHLIB_SYSLIBS = 
SHLIB_RPATH = 
# Switch between dynamicmaps.cf plugins and hard-linked databases.
NON_PLUGIN_MAP_OBJ = $(MAP_OBJ)
PLUGIN_MAP_OBJ = 
PLUGIN_MAP_OBJ_UPDATE = 
PLUGIN_MAP_SO_MAKE = 
PLUGIN_MAP_SO_UPDATE = 
PLUGIN_LD = 
# Application-specific rules.
SHELL	= /bin/sh
SRCS	= postmulti.c 
OBJS	= postmulti.o 
HDRS	= 
TESTSRC	= 
DEFS	= -I. -I$(INC_DIR) -D$(SYSTYPE)
CFLAGS	= $(DEBUG) $(OPT) $(DEFS)
FILES	= Makefile $(SRCS) $(HDRS)
INC_DIR	= ../../include
TESTPROG=
PROG	= postmulti
LIBS	= ../../lib/lib$(LIB_PREFIX)global$(LIB_SUFFIX) \
	../../lib/lib$(LIB_PREFIX)util$(LIB_SUFFIX)

.c.o:;	$(CC) $(CFLAGS) -c $*.c

$(PROG):	$(OBJS) $(LIBS)
	$(CC) $(CFLAGS) $(SHLIB_RPATH) -o $@ $(OBJS) $(LIBS) $(SYSLIBS)

$(OBJS): ../../conf/makedefs.out

Makefile: Makefile.in
	cat ../../conf/makedefs.out $? >$@

test:	$(TESTPROG)

tests:

root_tests:

update: ../../bin/$(PROG)

../../bin/$(PROG): $(PROG)
	cp $(PROG) ../../bin

printfck: $(OBJS) $(PROG)
	rm -rf printfck
	mkdir printfck
	sed '1,/^# do not edit/!d' Makefile >printfck/Makefile
	set -e; for i in *.c; do printfck -f .printfck $$i >printfck/$$i; done
	cd printfck; make "INC_DIR=../../../include" `cd ..; ls *.o`

shar:
	@shar $(FILES)

lint:
	lint $(SRCS)

clean:
	rm -f *.o *core $(PROG) $(TESTPROG) junk
	rm -rf printfck

tidy:	clean

depend: $(MAKES)
	(sed '1,/^# do not edit/!d' Makefile.in; \
	set -e; for i in [a-z][a-z0-9]*.c; do \
	    $(CC) -E $(DEFS) $(INCL) $$i | grep -v '[<>]' | sed -n -e '/^# *1 *"\([^"]*\)".*/{' \
	    -e 's//'`echo $$i|sed 's/c$$/o/'`': \1/' \
	    -e 's/o: \.\//o: /' -e p -e '}' ; \
	done | sort -u) | grep -v '[.][o][:][ ][/]' >$$$$ && mv $$$$ Makefile.in
	@$(EXPORT) make -f Makefile.in Makefile 1>&2

# do not edit below this line - it is generated by 'make depend'
postmulti.o: ../../include/argv.h
postmulti.o: ../../include/check_arg.h
postmulti.o: ../../include/clean_env.h
postmulti.o: ../../include/htable.h
postmulti.o: ../../include/mail_conf.h
postmulti.o: ../../include/mail_params.h
postmulti.o: ../../include/mail_parm_split.h
postmulti.o: ../../include/mail_version.h
postmulti.o: ../../include/msg.h
postmulti.o: ../../include/msg_syslog.h
postmulti.o: ../../include/msg_vstream.h
postmulti.o: ../../include/mymalloc.h
postmulti.o: ../../include/name_code.h
postmulti.o: ../../include/ring.h
postmulti.o: ../../include/safe.h
postmulti.o: ../../include/stringops.h
postmulti.o: ../../include/sys_defs.h
postmulti.o: ../../include/vbuf.h
postmulti.o: ../../include/vstream.h
postmulti.o: ../../include/vstring.h
postmulti.o: ../../include/vstring_vstream.h
postmulti.o: ../../include/warn_stat.h
postmulti.o: postmulti.c
