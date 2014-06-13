BUILT_SOURCES = grammar.h
AM_YFLAGS = -d

INCLUDES = $(DEPS_CFLAGS)
LDADD = $(DEPS_LIBS)

#Add extra debug info for gdb and nfdump includes
AM_CFLAGS = -ggdb -I$(top_srcdir)/include -I$(top_srcdir)/nfdump/bin

EXTRA_DIST = inline.c collector_inline.c nffile_inline.c nfdump_inline.c heapsort_inline.c applybits_inline.c

CLEANFILES = lex.yy.c grammar.c grammar.h scanner.c scanner.h

# Target for the libnfdump library
lib_LTLIBRARIES=libnf.la
libnf_la_SOURCES=libnf.c bit_array.c \
	nffile.c nfx.c nftree.c minilzo.c \
	nf_common.c grammar.y scanner.l \
	util.c ipconv.c 

# Simple infor program 
bin_PROGRAMS = libnf-info

libnf_info_SOURCES = libnf-info.c
libnf_info_LDADD = -lnf

