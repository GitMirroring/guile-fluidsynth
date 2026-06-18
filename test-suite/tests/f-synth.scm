;; -*- mode: scheme; coding: utf-8 -*-

;;;;
;;;; Copyright (C) 2026
;;;; David Pirotte (david at altosw dot be)

;;;; This file is part of Guile-Fluidsynth

;;;; Guile-Fluidsynth is free software; you can redistribute it and/or
;;;; modify it under the terms of the GNU Lesser General Public License
;;;; as published by the Free Software Foundation; either version 2.1 of
;;;; the License, or (at your option) any later version.

;;;; Guile-Fluidsynth is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;;; Lesser General Public License for more details.

;;;; You should have received a copy of the GNU Lesser General Public
;;;; License along with Guile-Fluidsynth.  If not, see
;;;; <https://www.gnu.org/licenses/>.
;;;;

;;; Commentary:

;;; Code:


(define-module (tests f-synth)
  #:use-module (oop goops)
  #:use-module (unit-test)
  #:use-module (f-synth)

  #:duplicates (merge-generics
		replace
		warn-override-core
		warn
		last))


(define %synth #f)

(define-class <f-synth-tests> (<test-case>))


;;;
;;;
;;;

(define-method (test-make-synth (self <f-synth-tests>))
  (let ((synth (assert (make <synth>))))
    (set! %synth synth)))

(define-method (test-make-noteon (self <f-synth-tests>))
  (assert (noteon %synth 0 60 100)))

(define-method (test-make-noteoff (self <f-synth-tests>))
  (assert (noteoff %synth 0 60)))

(define-method (test-get-sfont-programs (self <f-synth-tests>))
  (assert (get-sfont-programs %synth)))

(define-method (test-program-select (self <f-synth-tests>))
  (assert (program-select %synth 0 0 19))) ;; "Church Organ"


(exit-with-summary (run-all-defined-test-cases))
