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


(define-module (f-synth synth)
  #:use-module (ice-9 format)
  #:use-module (oop goops)
  #:use-module (system foreign)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata)
  #:use-module (f-synth support)
  #:use-module (f-synth ffi)
  #:use-module (f-synth defaults)

  #:duplicates (merge-generics
		replace
		warn-override-core
		warn
		last)

  #:export (<synth>))


(g-export !settings
          !synth
          !audio-driver
          !soundfont
          !sfid
          !gain

          sfload
          noteon
          noteoff
          program-select
          get-sfont-by-id

          get-sfont-programs)


(define-class <synth> ()
  (settings #:accessor !settings)
  (synth #:accessor !synth)
  (audio-driver #:accessor !audio-driver)
  (soundfont #:accessor !soundfont)
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

(define %no-soundfont
  "Failed to open the soundfont ~A: File does not exist.")

(define-method (initialize (self <synth>) initargs)
  (next-method)
  (let ((soundfont (get-keyword #:soundfont initargs (stow-ref 'soundfont)))
        (gain (get-keyword #:gain initargs (stow-ref 'gain))))
    (if (access? soundfont R_OK)
        (let* ((settings (new_fluid_settings))
               (synth (new_fluid_synth settings))
               (sfid (fluid_synth_sfload synth soundfont 1))
               (audio-driver (new_fluid_audio_driver settings synth)))
          (mslot-set! self
                      'settings settings
                      'synth synth
                      'soundfont soundfont
                      'audio-driver audio-driver
                      'sfid sfid)
          (fluid_settings_setnum settings "synth.gain" gain))
        (error (format #f "~?" %no-soundfont (list soundfont))))))

(define-method* (sfload (self <synth>) filename
                        #:optional (presets? #t))
  (let ((sfid (fluid_synth_sfload (!synth self)
                                  filename
                                  (scm->c presets? 'boolean))))
    (mslot-set! self
                'soundfont filename
                'sfid sfid)
    sfid))

(define-method (noteon (self <synth>) chan key vel)
  "CHAN > 0, KEY and VEL in the [0 127] range"
  (fluid_synth_noteon (!synth self) chan key vel)
  (values))

(define-method (noteoff (self <synth>) chan key)
  "CHAN > 0, KEY in the [0 127] range"
  (fluid_synth_noteoff (!synth self) chan key)
  (values))

(define-method* (program-select (self <synth>) chan bank preset
                                #:optional (sfid (!sfid self)))
  (fluid_synth_program_select (!synth self) chan sfid bank preset)
  (values))

(define-method* (get-sfont-by-id (self <synth>)
                                 #:optional (sfid (!sfid self)))
  (fluid_synth_get_sfont_by_id (!synth self) sfid))

(define-method* (get-sfont-programs (self <synth>)
                                    #:optional (sfid (!sfid self)))
  (let ((sfont (get-sfont-by-id self sfid))
        (offset (fluid_synth_get_bank_offset (!synth self) sfid)))
    (fluid_sfont_iteration_start sfont)
    (let loop ((iter (fluid_sfont_iteration_next sfont))
               (result '()))
      (if (null-pointer? iter)
          (reverse result)
          (let ((bank-nb (+ offset
                            (fluid_preset_get_banknum iter)))
                (preset-nb (fluid_preset_get_num iter))
                (name (pointer->string (fluid_preset_get_name iter))))
            (loop (fluid_sfont_iteration_next sfont)
                  (cons (list name bank-nb preset-nb)
                        result)))))))
