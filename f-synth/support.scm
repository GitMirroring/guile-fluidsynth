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


(define-module (f-synth support)
  #:use-module (f-synth support module)
  #:use-module (f-synth support goops)
  #:use-module (f-synth support g-export)
  #:use-module (f-synth support stow)
  #:use-module (f-synth support utils))


(eval-when (compile load eval)
  (re-export-public-interface (f-synth support module)
                               (f-synth support goops)
                               (f-synth support g-export)
                               (f-synth support stow)
                               (f-synth support utils)))
