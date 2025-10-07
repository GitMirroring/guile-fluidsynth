;; -*- mode: scheme; coding: utf-8 -*-

;;;;
;;;; Copyright (C) 2025
;;;; David Pirotte (david at altosw dot be)

;;;; This file is part of Guile-Fluidsynth

;;;; Guile-Fluidsynth is free software; you can redistribute it and/or
;;;; modify it under the terms of the GNU General Public License as
;;;; published by the Free Software Foundation; either version 3 of the
;;;; License, or (at your option) any later version.

;;;; Guile-Fluidsynth is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;;; General Public License for more details.

;;;; You should have received a copy of the GNU General Public License
;;;; along with Guile-Fluidsynth.  If not, see
;;;; <https://www.gnu.org/licenses/gpl.html>.
;;;;

;;; Commentary:

;;; Code:


(define-module (f-synth)
  #:use-module (oop goops)
  #:use-module (oop goops describe)
  #:use-module (system foreign)
  #:use-module (rnrs bytevectors)
  #:use-module (ice-9 match)
  #:use-module (ice-9 receive)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-4)
  #:use-module (f-synth support module)

  #:duplicates (merge-generics
		replace
		warn-override-core
		warn
		last))


(eval-when (compile load eval)
  (re-export-public-interface (oop goops)
                              (oop goops describe)
			      (system foreign)
			      (rnrs bytevectors)
			      (ice-9 match)
                              (ice-9 receive)
			      (srfi srfi-1)
			      (srfi srfi-4)
                              (f-synth support module)))
