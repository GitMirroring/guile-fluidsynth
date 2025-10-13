;; generated with `guild compile-ffi f-synth/ffi/audio.ffi'
;; using nyacc version 3.00.0

(define-module (f-synth ffi audio)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (define (flc l) (load-foreign-library (car l) #:search-path (list)))
  (let loop ((libs (list #f "libfluidsynth")))
    (cond
      ((null? libs) (error "no library for ~s" name))
      ((false-if-exception (foreign-library-pointer (flc libs) name)))
      (else (loop (cdr libs))))))


;; typedef int (*fluid_audio_func_t)(void *data, int len, int nfx, float *fx[]
;;     , int nout, float *out[]);
(define *fluid_audio_func_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (data len nfx fx nout out)
        ((lambda (~ret) (cdata-arg->number ~ret))
         (~proc data len nfx fx nout out)))
      (list '* ffi:int ffi:int (make-list #f '*) ffi:int (make-list #f '*))))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure
                   ffi:int
                   ~fptr
                   (list '*
                         ffi:int
                         ffi:int
                         (make-list #f '*)
                         ffi:int
                         (make-list #f '*)))))
       (lambda (data len nfx fx nout out)
         (let ((data (cdata-arg->pointer data))
               (len (cdata-arg->number len))
               (nfx (cdata-arg->number nfx))
               (fx (cdata-arg->pointer fx))
               (nout (cdata-arg->number nout))
               (out (cdata-arg->pointer out)))
           (~proc data len nfx fx nout out)))))))
(define-public fluid_audio_func_t
  (name-ctype 'fluid_audio_func_t (cpointer *fluid_audio_func_t)))

;; fluid_audio_driver_t *new_fluid_audio_driver(fluid_settings_t *settings, 
;;     fluid_synth_t *synth);
(define-public new_fluid_audio_driver
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_audio_driver")
                       (list '* '*)))))
    (lambda (settings synth)
      (let ((settings (cdata-arg->pointer settings))
            (synth (cdata-arg->pointer synth)))
        ((force ~proc) settings synth)))))

;; fluid_audio_driver_t *new_fluid_audio_driver2(fluid_settings_t *settings, 
;;     fluid_audio_func_t func, void *data);
(define-public new_fluid_audio_driver2
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_audio_driver2")
                       (list '* '* '*)))))
    (lambda (settings func data)
      (let ((settings (cdata-arg->pointer settings))
            (func (cdata-arg->pointer func fluid_audio_func_t))
            (data (cdata-arg->pointer data)))
        ((force ~proc) settings func data)))))

;; void delete_fluid_audio_driver(fluid_audio_driver_t *driver);
(define-public delete_fluid_audio_driver
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_audio_driver")
                       (list '*)))))
    (lambda (driver)
      (let ((driver (cdata-arg->pointer driver))) ((force ~proc) driver)))))

;; int fluid_audio_driver_register(const char **adrivers);
(define-public fluid_audio_driver_register
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_audio_driver_register")
                       (list '*)))))
    (lambda (adrivers)
      (let ((adrivers (cdata-arg->pointer adrivers))) ((force ~proc) adrivers)))))

;; fluid_file_renderer_t *new_fluid_file_renderer(fluid_synth_t *synth);
(define-public new_fluid_file_renderer
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_file_renderer")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; void delete_fluid_file_renderer(fluid_file_renderer_t *dev);
(define-public delete_fluid_file_renderer
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_file_renderer")
                       (list '*)))))
    (lambda (dev) (let ((dev (cdata-arg->pointer dev))) ((force ~proc) dev)))))

;; int fluid_file_renderer_process_block(fluid_file_renderer_t *dev);
(define-public fluid_file_renderer_process_block
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_file_renderer_process_block")
                       (list '*)))))
    (lambda (dev) (let ((dev (cdata-arg->pointer dev))) ((force ~proc) dev)))))

;; int fluid_file_set_encoding_quality(fluid_file_renderer_t *dev, double q);
(define-public fluid_file_set_encoding_quality
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_file_set_encoding_quality")
                       (list '* ffi:double)))))
    (lambda (dev q)
      (let ((dev (cdata-arg->pointer dev)) (q (cdata-arg->number q)))
        ((force ~proc) dev q)))))

;; access to enum symbols and #define'd constants:
(define f-synth-ffi-audio-symbol-tab '((BUILD_SHARED_LIBS . 1)))
(export f-synth-ffi-audio-symbol-tab)

(define f-synth-ffi-audio-symbol-val
  (lambda (k) (or (assq-ref f-synth-ffi-audio-symbol-tab k))))
(export f-synth-ffi-audio-symbol-val)

(define (unwrap~enum arg)
  (cond
    ((number? arg) arg)
    ((symbol? arg) (f-synth-ffi-audio-symbol-val arg))
    ((cdata? arg) (cdata-ref arg))
    (else (error "type mismatch"))))

(define f-synth-ffi-audio-types
  '("fluid_audio_func_t"))
(export f-synth-ffi-audio-types)

;; --- last line ---
