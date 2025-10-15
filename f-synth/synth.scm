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


(g-export !settings
          !synth
          !audio-driver
          !sfid
          !gain

          sfload
          noteon
          noteoff)


(define-class <synth> ()
  (settings #:accessor !settings)
  (synth #:accessor !synth)
  (audio-driver #:accessor !audio-driver)
  (sfid  #:accessor !sfid)
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
  (let* ((gain (get-keyword #:gain initargs 0.5))
         (settings (new_fluid_settings))
         (synth (new_fluid_synth settings))
         (sfid (fluid_synth_sfload synth "/usr/share/sounds/sf2/FluidR3_GM.sf2" 1))
         (audio-driver (new_fluid_audio_driver settings synth)))
    (mslot-set! self
                'settings settings
                'synth synth
                'audio-driver audio-driver
                'sfid sfid)
    (fluid_settings_setnum settings "synth.gain" gain)))

(define-method (sfload (self <synth>) name preset?)
  (fluid_synth_sfload (!synth self) name (scm->c preset? 'boolean)))

(define-method (noteon (self <synth>) chan key vel)
  "CHAN > 0, KEY and VEL in the [0 127] range"
  (fluid_synth_noteon (!synth self) chan key vel)
  (values))

(define-method (noteoff (self <synth>) chan key)
  "CHAN > 0, KEY in the [0 127] range"
  (fluid_synth_noteoff (!synth self) chan key)
  (values))
