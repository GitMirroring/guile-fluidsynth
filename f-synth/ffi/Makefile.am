
####
#### Copyright (C) 2026
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
#### <https://www.gnu.org/licenses/>.
####


ffimoddir = $(SITEDIR)
ffigodir = $(SITECCACHEDIR)


FFI_SOURCES = \
	types.ffi	\
	settings.ffi	\
	synth.ffi	\
	audio.ffi	\
	sfont.ffi

FFI_SCM = \
	types.scm	\
	settings.scm	\
	synth.scm	\
	audio.scm	\
	sfont.scm

SUFFIXES = .ffi .scm
.ffi.scm:
	$(GUILD) compile-ffi  -o "$@" "$<"


FFI_GOBJECTS = \
	$(FFI_SCM:%.scm=%.go)


nobase_ffimod_DATA = $(FFI_SOURCES) $(FFI_SCM)
nobase_ffigo_DATA = $(FFI_GOBJECTS)


# Make sure source files are installed first, so that the mtime of
# installed compiled files is greater than that of installed source
# files.  See
# <http://lists.gnu.org/archive/html/guile-devel/2010-07/msg00125.html>
# for details.
ffi_install_go_files = install-nobase_ffigoDATA
$(ffi_install_go_files): install-nobase_ffimodDATA

GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat

SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN) $(top_builddir)/pre-inst-env \
	$(GUILD) compile $(GUILE_WARNINGS) $(GUILE_TARGET) -o "$@" "$<"


EXTRA_DIST = \
	$(FFI_SOURCES)


CLEANFILES = \
	$(FFI_SCM)			\
	$(FFI_GOBJECTS)


all: $(FFI_SCM) $(FFI_GOBJECTS)
