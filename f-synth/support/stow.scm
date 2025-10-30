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


(define-module (f-synth support stow)
  #:export (%stow
            stow-ref
            stow-set!
            stow-reset!
            stow-remove!
            stow->alist))


(define %stow #f)
(define stow-ref #f)
(define stow-set! #f)
(define stow-reset! #f)
(define stow-remove! #f)
(define stow->alist #f)


(eval-when (expand load eval)
  (let* ((stow-default-size 13)
         (stow (make-hash-table stow-default-size)))

    (set! %stow stow)

    (set! stow-ref
	  (lambda (key)
            (hashq-ref stow key)))

    (set! stow-set!
	  (lambda (key value)
            (hashq-set! stow key value)))

    (set! stow-reset!
	  (lambda ()
            (hash-for-each (lambda (key value)
                             (hashq-remove! stow key))
                stow)))

    (set! stow-remove!
          (lambda (key)
            (hashq-remove! stow key)))

    (set! stow->alist
          (lambda ()
            (hash-map->list cons stow)))))
