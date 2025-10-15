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


(define-module (f-synth synth)
  #:use-module (ice-9 format)
  #:use-module (oop goops)
  #:use-module (system foreign)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata)
  #:use-module (f-synth support)
  #:use-module (f-synth ffi)

  #:duplicates (merge-generics
		replace
		warn-override-core
		warn
		last)

  #:export (<synth>))


(g-export !gain)


(define-class <synth> ()
  (settings #:accessor !settings)
  (synth #:accessor !synth)
  (gain #:accessor !gain
        #:allocation #:virtual
        #:slot-ref (lambda (obj)
                     (let ((settings (!settings obj))
                           (gain (make-cdata (cbase 'double))))
                       (fluid_settings_getnum settings "synth.gain" (cdata& gain))
                       (cdata-ref gain)))
        #:slot-set! (lambda (obj val)
                      (fluid_settings_setnum (!settings obj) "synth.gain" val)
                      (values))))

(define-method (initialize (self <synth>) initargs)
  (next-method)
  (let* ((gain (get-keyword #:gain initargs #f))
         (settings (new_fluid_settings))
         (synth (new_fluid_synth settings)))
    (mslot-set! self
                'settings settings
                'synth synth)
    (when gain
       (fluid_settings_setnum settings "synth.gain" gain))))
