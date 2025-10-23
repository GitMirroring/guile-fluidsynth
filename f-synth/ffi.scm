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
;;;; <https://www.gnu.org/licenses/>.
;;;;

;;; Commentary:

;;; Code:


(define-module (f-synth ffi)
  #:use-module (f-synth support module)
  #:use-module (f-synth ffi types)
  #:use-module (f-synth ffi settings)
  #:use-module (f-synth ffi synth)
  #:use-module (f-synth ffi audio)
  #:use-module (f-synth ffi sfont))


(eval-when (compile load eval)
  (re-export-public-interface (f-synth ffi types)
                              (f-synth ffi settings)
                              (f-synth ffi synth)
                              (f-synth ffi audio)
                              (f-synth ffi sfont)))
