;; -*- mode: scheme; coding: utf-8 -*-

;;;;
;;;; Copyright (C) 2025
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
;;;; <https://www.gnu.org/licenses/lglp.html>.
;;;;

;;; Commentary:

;;; Code:


(define-module (f-synth support goops)
  #:use-module (ice-9 match)
  #:use-module (oop goops)
  ;; #:use-module (g-golf support g-export)

  #:duplicates (merge-generics
		replace
		warn-override-core
		warn
		last)

  #:export (mslot-set!))


#;(g-export )


(define (mslot-set! self . args)
  (if (even? (length args))
      (let loop ((args args))
        (match args
          (()
           (values))
          ((name val . rest)
           (slot-set! self name val)
           (loop rest))))
      (error "Wrong number of arguments: " args)))
