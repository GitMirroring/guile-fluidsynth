
####
#### Copyright (C) 2025
#### David Pirotte (david at altosw dot be)

#### This file is part of Guile-Fluidsynth

#### Guile-Fluidsynth is free software; you can redistribute it and/or
#### modify it under the terms of the GNU General Public License as
#### published by the Free Software Foundation; either version 3 of the
#### License, or (at your option) any later version.

#### Guile-Fluidsynth is distributed in the hope that it will be useful,
#### but WITHOUT ANY WARRANTY; without even the implied warranty of
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#### General Public License for more details.

#### You should have received a copy of the GNU General Public License
#### along with Guile-Fluidsynth.  If not, see
#### <https://www.gnu.org/licenses/gpl.html>.
####


include $(top_srcdir)/am/guile.mk


pkgconfig_DATA=meta/guile-fluidsynth-1.0.pc

SOURCES = \
	f-synth/support/module.scm	\
	f-synth.scm

# NOCOMP_SOURCES= \
#	$(wildcard cv/images/*)
# 	$(wildcard cv/latex/*)	\
# 	$(wildcard cv/gtkrc/*)	\
# 	$(shell find $(top_srcdir)/cv/pof -type f)

EXTRA_DIST = \
	AUTHORS				\
	ChangeLog			\
	COPYING				\
	INSTALL				\
	LICENSE				\
	NEWS				\
	README				\
	pre-inst-env.in			\
	meta/guile-fluidsynth-1.0.pc.in	\
	$(wildcard am/*)		\
	$(wildcard m4/*)		\
	$(SOURCES)
#	$(NOCOMP_SOURCES)

# bin_SCRIPTS = cv/cv

CLEANFILES = \
	meta/guile-fluidsynth-1.0.pc	\
	$(GOBJECTS)
# 	$(bin_SCRIPTS)

ETAGS_ARGS = \
	$(SOURCES)
# guile-cv

#SUBDIRS = \
#	test-suite			\
#	doc


#distclean-local:
#	rm -f Makefile
#	rm -f Makefile.in
#	rm -f aclocal.m4
#	rm -rf autom4te.cache
#	rm -f build-aux/compile
#	rm -f build-aux/config.guess
#	rm -f build-aux/config.sub
#	rm -f build-aux/depcomp
#	rm -f build-aux/install-sh
#	rm -f build-aux/ltmain.sh
#	rm -f build-aux/mdate-sh
#	rm -f build-aux/missing
#	rm -f build-aux/texinfo.tex
#	rm -f build-aux/*~
#	rm -f *~
#	rm -f guile-cv-*.tar.gz
#	rm -f guile-cv-*.tar.gz.sig
#	rm -f libguile-cv/Makefile
#	rm -f libguile-cv/Makefile.in
#	rm -f libguile-cv/libguile-cv.la
#	rm -f libguile-cv/libguile-cv.lo
#	rm -f libguile-cv/libguile-cv.so
#	rm -rf doc/guile-cv
#	rm -f doc/TAGS
#	rm -f doc/*.info
#	rm -f doc/*.pdf
#	rm -f doc/*~
#	rm -f doc/*.aux doc/*.cp doc/*.cps doc/*.fn doc/*.fns doc/*.ky
#	rm -f doc/*.log doc/*.pg doc/*.toc doc/*.tp doc/*.vr doc/*.vrs
#	rm -f doc/Makefile
#	rm -f doc/Makefile.in
#	rm -f doc/stamp-vti
#	rm -f doc/version.texi
#	rm -f cv/TAGS
#	rm -f cv/*~
#	rm -f test-suite/Makefile
#	rm -f test-suite/Makefile.in
#	rm -f m4/libtool.m4
#	rm -f m4/ltoptions.m4
#	rm -f m4/ltsugar.m4
#	rm -f m4/ltversion.m4
#	rm -f m4/lt~obsolete.m4
#	rm -f m4/*~


ACLOCAL_AMFLAGS = -I m4

# * .PHONY: gen-pof:

# Makefile.am ends here
