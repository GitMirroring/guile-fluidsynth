
####
#### Copyright (C) 2025
#### David Pirotte (david at altosw dot be)

#### This file is part of Guile-Fluidsynth

#### Guile-Fluidsynth is free software; you can redistribute it and/or
#### modify it under the terms of the GNU Lesser General Public License
#### as published by the Free Software Foundation; either version 2.1 of
#### the License, or (at your option) any later version.

#### Guile-Fluidsynth is distributed in the hope that it will be useful,
#### but WITHOUT ANY WARRANTY; without even the implied warranty of
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#### Lesser General Public License for more details.

#### You should have received a copy of the GNU Lesser General Public
#### License along with Guile-Fluidsynth.  If not, see
#### <https://www.gnu.org/licenses/lgpl.html>.
####


include $(top_srcdir)/am/guile.mk


pkgconfig_DATA=meta/guile-fluidsynth-1.0.pc

SOURCES = \
	f-synth/support/module.scm	\
	f-synth/support/goops.scm	\
	f-synth/support/g-export.scm	\
	f-synth/support/utils.scm	\
	f-synth/support.scm		\
	f-synth/ffi/types.scm		\
	f-synth/ffi/settings.scm	\
	f-synth/ffi/synth.scm		\
	f-synth/ffi/audio.scm		\
	f-synth/ffi/sfont.scm		\
	f-synth/ffi.scm			\
	f-synth/synth.scm		\
	f-synth.scm

NOCOMP_SOURCES= \
	$(wildcard f-synth/ffi/*.ffi)

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
	$(SOURCES)			\
	$(NOCOMP_SOURCES)

# bin_SCRIPTS = cv/cv

CLEANFILES = \
	meta/guile-fluidsynth-1.0.pc	\
	$(GOBJECTS)
# 	$(bin_SCRIPTS)

ETAGS_ARGS = \
	$(SOURCES)

SUBDIRS = \
	doc
#	test-suite


ACLOCAL_AMFLAGS = -I m4

# * .PHONY: gen-pof:

# Makefile.am ends here
