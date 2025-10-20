
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
#### <https://www.gnu.org/licenses/gpl.html>.
####


# AUTOMAKE_OPTIONS = gnu

info_TEXINFOS = guile-fluidsynth.texi

#DOC_IMAGES = \
#	$(wildcard images/*)

DOC_CSS = \
	$(wildcard css/*.css)

guile_fluidsynth_TEXINFOS = \
	version.texi			\
	variables.texi			\
	preface.texi     		\
	introduction.texi		\
	using-guile-fluidsynth.texi	\
	indices.texi			\
	fdl.texi			\
	$(DOC_CSS)

nobase_doc_DATA = \
	$(DOC_CSS)

EXTRA_DIST = \
	$(DOC_CSS)

AM_MAKEINFOHTMLFLAGS = \
	-c DOCTYPE='<!DOCTYPE html>'	\
	-c FORMAT_MENU='menu'		\
	--css-ref=../css/manual.css
