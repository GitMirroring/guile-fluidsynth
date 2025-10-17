;; generated with `guild compile-ffi f-synth/ffi/sfont.ffi'
;; using nyacc version 3.00.0

(define-module (f-synth ffi sfont)
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


;; enum fluid_sample_type {
;;   FLUID_SAMPLETYPE_MONO = 0x1,
;;   FLUID_SAMPLETYPE_RIGHT = 0x2,
;;   FLUID_SAMPLETYPE_LEFT = 0x4,
;;   FLUID_SAMPLETYPE_LINKED = 0x8,
;;   FLUID_SAMPLETYPE_OGG_VORBIS = 0x10,
;;   FLUID_SAMPLETYPE_ROM = 0x8000,
;; };
(define-public enum-fluid_sample_type
  (name-ctype
   'enum-fluid_sample_type
   (cenum '((FLUID_SAMPLETYPE_MONO 1)
            (FLUID_SAMPLETYPE_RIGHT 2)
            (FLUID_SAMPLETYPE_LEFT 4)
            (FLUID_SAMPLETYPE_LINKED 8)
            (FLUID_SAMPLETYPE_OGG_VORBIS 16)
            (FLUID_SAMPLETYPE_ROM 32768)))))
(define-public unwrap-enum-fluid_sample_type
  (let ((numf (cenum-numf (ctype-info enum-fluid_sample_type))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_sample_type
  (let ((symf (cenum-symf (ctype-info enum-fluid_sample_type))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef fluid_sfont_t *(*fluid_sfloader_load_t)(fluid_sfloader_t *loader, 
;;     const char *filename);
(define *fluid_sfloader_load_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (loader filename)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc loader filename)))
      (list '* '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '* '*))))
       (lambda (loader filename)
         (let ((loader (cdata-arg->pointer loader))
               (filename (cdata-arg->pointer filename)))
           (~proc loader filename)))))))
(define-public fluid_sfloader_load_t
  (name-ctype 'fluid_sfloader_load_t (cpointer *fluid_sfloader_load_t)))

;; typedef void (*fluid_sfloader_free_t)(fluid_sfloader_t *loader);
(define *fluid_sfloader_free_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:void
      (lambda (loader) (~proc loader))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '*))))
       (lambda (loader)
         (let ((loader (cdata-arg->pointer loader))) (~proc loader)))))))
(define-public fluid_sfloader_free_t
  (name-ctype 'fluid_sfloader_free_t (cpointer *fluid_sfloader_free_t)))

;; fluid_sfloader_t *new_fluid_sfloader(fluid_sfloader_load_t load, 
;;     fluid_sfloader_free_t free);
(define-public new_fluid_sfloader
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_sfloader")
                       (list '* '*)))))
    (lambda (load free)
      (let ((load (cdata-arg->pointer load fluid_sfloader_load_t))
            (free (cdata-arg->pointer free fluid_sfloader_free_t)))
        ((force ~proc) load free)))))

;; void delete_fluid_sfloader(fluid_sfloader_t *loader);
(define-public delete_fluid_sfloader
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_sfloader")
                       (list '*)))))
    (lambda (loader)
      (let ((loader (cdata-arg->pointer loader))) ((force ~proc) loader)))))

;; fluid_sfloader_t *new_fluid_defsfloader(fluid_settings_t *settings);
(define-public new_fluid_defsfloader
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_defsfloader")
                       (list '*)))))
    (lambda (settings)
      (let ((settings (cdata-arg->pointer settings))) ((force ~proc) settings)))))

;; typedef void *(*fluid_sfloader_callback_open_t)(const char *filename);
(define *fluid_sfloader_callback_open_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (filename)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc filename)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '*))))
       (lambda (filename)
         (let ((filename (cdata-arg->pointer filename))) (~proc filename)))))))
(define-public fluid_sfloader_callback_open_t
  (name-ctype
   'fluid_sfloader_callback_open_t
   (cpointer *fluid_sfloader_callback_open_t)))

;; typedef int (*fluid_sfloader_callback_read_t)(void *buf, fluid_long_long_t 
;;     count, void *handle);
(define *fluid_sfloader_callback_read_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (buf count handle)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc buf count handle)))
      (list '* ffi:int64 '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int ~fptr (list '* ffi:int64 '*))))
       (lambda (buf count handle)
         (let ((buf (cdata-arg->pointer buf))
               (count (cdata-arg->number count))
               (handle (cdata-arg->pointer handle)))
           (~proc buf count handle)))))))
(define-public fluid_sfloader_callback_read_t
  (name-ctype
   'fluid_sfloader_callback_read_t
   (cpointer *fluid_sfloader_callback_read_t)))

;; typedef int (*fluid_sfloader_callback_seek_t)(void *handle, 
;;     fluid_long_long_t offset, int origin);
(define *fluid_sfloader_callback_seek_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (handle offset origin)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc handle offset origin)))
      (list '* ffi:int64 ffi:int)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure
                   ffi:int
                   ~fptr
                   (list '* ffi:int64 ffi:int))))
       (lambda (handle offset origin)
         (let ((handle (cdata-arg->pointer handle))
               (offset (cdata-arg->number offset))
               (origin (cdata-arg->number origin)))
           (~proc handle offset origin)))))))
(define-public fluid_sfloader_callback_seek_t
  (name-ctype
   'fluid_sfloader_callback_seek_t
   (cpointer *fluid_sfloader_callback_seek_t)))

;; typedef int (*fluid_sfloader_callback_close_t)(void *handle);
(define *fluid_sfloader_callback_close_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (handle)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc handle)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int ~fptr (list '*))))
       (lambda (handle)
         (let ((handle (cdata-arg->pointer handle))) (~proc handle)))))))
(define-public fluid_sfloader_callback_close_t
  (name-ctype
   'fluid_sfloader_callback_close_t
   (cpointer *fluid_sfloader_callback_close_t)))

;; typedef fluid_long_long_t (*fluid_sfloader_callback_tell_t)(void *handle);
(define *fluid_sfloader_callback_tell_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int64
      (lambda (handle)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc handle)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int64 ~fptr (list '*))))
       (lambda (handle)
         (let ((handle (cdata-arg->pointer handle))) (~proc handle)))))))
(define-public fluid_sfloader_callback_tell_t
  (name-ctype
   'fluid_sfloader_callback_tell_t
   (cpointer *fluid_sfloader_callback_tell_t)))

;; int fluid_sfloader_set_callbacks(fluid_sfloader_t *loader, 
;;     fluid_sfloader_callback_open_t open, fluid_sfloader_callback_read_t read
;;     , fluid_sfloader_callback_seek_t seek, fluid_sfloader_callback_tell_t 
;;     tell, fluid_sfloader_callback_close_t close);
(define-public fluid_sfloader_set_callbacks
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sfloader_set_callbacks")
                       (list '* '* '* '* '* '*)))))
    (lambda (loader open read seek tell close)
      (let ((loader (cdata-arg->pointer loader))
            (open (cdata-arg->pointer open fluid_sfloader_callback_open_t))
            (read (cdata-arg->pointer read fluid_sfloader_callback_read_t))
            (seek (cdata-arg->pointer seek fluid_sfloader_callback_seek_t))
            (tell (cdata-arg->pointer tell fluid_sfloader_callback_tell_t))
            (close (cdata-arg->pointer close fluid_sfloader_callback_close_t)))
        ((force ~proc) loader open read seek tell close)))))

;; int fluid_sfloader_set_data(fluid_sfloader_t *loader, void *data);
(define-public fluid_sfloader_set_data
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sfloader_set_data")
                       (list '* '*)))))
    (lambda (loader data)
      (let ((loader (cdata-arg->pointer loader))
            (data (cdata-arg->pointer data)))
        ((force ~proc) loader data)))))

;; void *fluid_sfloader_get_data(fluid_sfloader_t *loader);
(define-public fluid_sfloader_get_data
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_sfloader_get_data")
                       (list '*)))))
    (lambda (loader)
      (let ((loader (cdata-arg->pointer loader))) ((force ~proc) loader)))))

;; typedef const char *(*fluid_sfont_get_name_t)(fluid_sfont_t *sfont);
(define *fluid_sfont_get_name_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (sfont)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc sfont)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '*))))
       (lambda (sfont)
         (let ((sfont (cdata-arg->pointer sfont))) (~proc sfont)))))))
(define-public fluid_sfont_get_name_t
  (name-ctype 'fluid_sfont_get_name_t (cpointer *fluid_sfont_get_name_t)))

;; typedef fluid_preset_t *(*fluid_sfont_get_preset_t)(fluid_sfont_t *sfont, 
;;     int bank, int prenum);
(define *fluid_sfont_get_preset_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (sfont bank prenum)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc sfont bank prenum)))
      (list '* ffi:int ffi:int)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '* ffi:int ffi:int))))
       (lambda (sfont bank prenum)
         (let ((sfont (cdata-arg->pointer sfont))
               (bank (cdata-arg->number bank))
               (prenum (cdata-arg->number prenum)))
           (~proc sfont bank prenum)))))))
(define-public fluid_sfont_get_preset_t
  (name-ctype 'fluid_sfont_get_preset_t (cpointer *fluid_sfont_get_preset_t)))

;; typedef void (*fluid_sfont_iteration_start_t)(fluid_sfont_t *sfont);
(define *fluid_sfont_iteration_start_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer ffi:void (lambda (sfont) (~proc sfont)) (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '*))))
       (lambda (sfont)
         (let ((sfont (cdata-arg->pointer sfont))) (~proc sfont)))))))
(define-public fluid_sfont_iteration_start_t
  (name-ctype
   'fluid_sfont_iteration_start_t
   (cpointer *fluid_sfont_iteration_start_t)))

;; typedef fluid_preset_t *(*fluid_sfont_iteration_next_t)(fluid_sfont_t *sfont
;;     );
(define *fluid_sfont_iteration_next_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (sfont)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc sfont)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '*))))
       (lambda (sfont)
         (let ((sfont (cdata-arg->pointer sfont))) (~proc sfont)))))))
(define-public fluid_sfont_iteration_next_t
  (name-ctype
   'fluid_sfont_iteration_next_t
   (cpointer *fluid_sfont_iteration_next_t)))

;; typedef int (*fluid_sfont_free_t)(fluid_sfont_t *sfont);
(define *fluid_sfont_free_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (sfont) ((lambda (~ret) (cdata-arg->number ~ret)) (~proc sfont)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int ~fptr (list '*))))
       (lambda (sfont)
         (let ((sfont (cdata-arg->pointer sfont))) (~proc sfont)))))))
(define-public fluid_sfont_free_t
  (name-ctype 'fluid_sfont_free_t (cpointer *fluid_sfont_free_t)))

;; fluid_sfont_t *new_fluid_sfont(fluid_sfont_get_name_t get_name, 
;;     fluid_sfont_get_preset_t get_preset, fluid_sfont_iteration_start_t 
;;     iter_start, fluid_sfont_iteration_next_t iter_next, fluid_sfont_free_t 
;;     free);
(define-public new_fluid_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_sfont")
                       (list '* '* '* '* '*)))))
    (lambda (get_name get_preset iter_start iter_next free)
      (let ((get_name (cdata-arg->pointer get_name fluid_sfont_get_name_t))
            (get_preset
             (cdata-arg->pointer get_preset fluid_sfont_get_preset_t))
            (iter_start
             (cdata-arg->pointer iter_start fluid_sfont_iteration_start_t))
            (iter_next
             (cdata-arg->pointer iter_next fluid_sfont_iteration_next_t))
            (free (cdata-arg->pointer free fluid_sfont_free_t)))
        ((force ~proc) get_name get_preset iter_start iter_next free)))))

;; int delete_fluid_sfont(fluid_sfont_t *sfont);
(define-public delete_fluid_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "delete_fluid_sfont")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; int fluid_sfont_set_data(fluid_sfont_t *sfont, void *data);
(define-public fluid_sfont_set_data
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sfont_set_data")
                       (list '* '*)))))
    (lambda (sfont data)
      (let ((sfont (cdata-arg->pointer sfont))
            (data (cdata-arg->pointer data)))
        ((force ~proc) sfont data)))))

;; void *fluid_sfont_get_data(fluid_sfont_t *sfont);
(define-public fluid_sfont_get_data
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_sfont_get_data")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; int fluid_sfont_get_id(fluid_sfont_t *sfont);
(define-public fluid_sfont_get_id
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sfont_get_id")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; const char *fluid_sfont_get_name(fluid_sfont_t *sfont);
(define-public fluid_sfont_get_name
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_sfont_get_name")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; fluid_preset_t *fluid_sfont_get_preset(fluid_sfont_t *sfont, int bank, int 
;;     prenum);
(define-public fluid_sfont_get_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_sfont_get_preset")
                       (list '* ffi:int ffi:int)))))
    (lambda (sfont bank prenum)
      (let ((sfont (cdata-arg->pointer sfont))
            (bank (cdata-arg->number bank))
            (prenum (cdata-arg->number prenum)))
        ((force ~proc) sfont bank prenum)))))

;; void fluid_sfont_iteration_start(fluid_sfont_t *sfont);
(define-public fluid_sfont_iteration_start
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_sfont_iteration_start")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; fluid_preset_t *fluid_sfont_iteration_next(fluid_sfont_t *sfont);
(define-public fluid_sfont_iteration_next
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_sfont_iteration_next")
                       (list '*)))))
    (lambda (sfont)
      (let ((sfont (cdata-arg->pointer sfont))) ((force ~proc) sfont)))))

;; typedef const char *(*fluid_preset_get_name_t)(fluid_preset_t *preset);
(define *fluid_preset_get_name_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      '*
      (lambda (preset)
        ((lambda (~ret) (cdata-arg->pointer ~ret)) (~proc preset)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure '* ~fptr (list '*))))
       (lambda (preset)
         (let ((preset (cdata-arg->pointer preset))) (~proc preset)))))))
(define-public fluid_preset_get_name_t
  (name-ctype 'fluid_preset_get_name_t (cpointer *fluid_preset_get_name_t)))

;; typedef int (*fluid_preset_get_banknum_t)(fluid_preset_t *preset);
(define *fluid_preset_get_banknum_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (preset)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc preset)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int ~fptr (list '*))))
       (lambda (preset)
         (let ((preset (cdata-arg->pointer preset))) (~proc preset)))))))
(define-public fluid_preset_get_banknum_t
  (name-ctype
   'fluid_preset_get_banknum_t
   (cpointer *fluid_preset_get_banknum_t)))

;; typedef int (*fluid_preset_get_num_t)(fluid_preset_t *preset);
(define *fluid_preset_get_num_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (preset)
        ((lambda (~ret) (cdata-arg->number ~ret)) (~proc preset)))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:int ~fptr (list '*))))
       (lambda (preset)
         (let ((preset (cdata-arg->pointer preset))) (~proc preset)))))))
(define-public fluid_preset_get_num_t
  (name-ctype 'fluid_preset_get_num_t (cpointer *fluid_preset_get_num_t)))

;; typedef int (*fluid_preset_noteon_t)(fluid_preset_t *preset, fluid_synth_t *
;;     synth, int chan, int key, int vel);
(define *fluid_preset_noteon_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:int
      (lambda (preset synth chan key vel)
        ((lambda (~ret) (cdata-arg->number ~ret))
         (~proc preset synth chan key vel)))
      (list '* '* ffi:int ffi:int ffi:int)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure
                   ffi:int
                   ~fptr
                   (list '* '* ffi:int ffi:int ffi:int))))
       (lambda (preset synth chan key vel)
         (let ((preset (cdata-arg->pointer preset))
               (synth (cdata-arg->pointer synth))
               (chan (cdata-arg->number chan))
               (key (cdata-arg->number key))
               (vel (cdata-arg->number vel)))
           (~proc preset synth chan key vel)))))))
(define-public fluid_preset_noteon_t
  (name-ctype 'fluid_preset_noteon_t (cpointer *fluid_preset_noteon_t)))

;; typedef void (*fluid_preset_free_t)(fluid_preset_t *preset);
(define *fluid_preset_free_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:void
      (lambda (preset) (~proc preset))
      (list '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '*))))
       (lambda (preset)
         (let ((preset (cdata-arg->pointer preset))) (~proc preset)))))))
(define-public fluid_preset_free_t
  (name-ctype 'fluid_preset_free_t (cpointer *fluid_preset_free_t)))

;; fluid_preset_t *new_fluid_preset(fluid_sfont_t *parent_sfont, 
;;     fluid_preset_get_name_t get_name, fluid_preset_get_banknum_t get_bank, 
;;     fluid_preset_get_num_t get_num, fluid_preset_noteon_t noteon, 
;;     fluid_preset_free_t free);
(define-public new_fluid_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_preset")
                       (list '* '* '* '* '* '*)))))
    (lambda (parent_sfont get_name get_bank get_num noteon free)
      (let ((parent_sfont (cdata-arg->pointer parent_sfont))
            (get_name (cdata-arg->pointer get_name fluid_preset_get_name_t))
            (get_bank (cdata-arg->pointer get_bank fluid_preset_get_banknum_t))
            (get_num (cdata-arg->pointer get_num fluid_preset_get_num_t))
            (noteon (cdata-arg->pointer noteon fluid_preset_noteon_t))
            (free (cdata-arg->pointer free fluid_preset_free_t)))
        ((force ~proc) parent_sfont get_name get_bank get_num noteon free)))))

;; void delete_fluid_preset(fluid_preset_t *preset);
(define-public delete_fluid_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_preset")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; int fluid_preset_set_data(fluid_preset_t *preset, void *data);
(define-public fluid_preset_set_data
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_preset_set_data")
                       (list '* '*)))))
    (lambda (preset data)
      (let ((preset (cdata-arg->pointer preset))
            (data (cdata-arg->pointer data)))
        ((force ~proc) preset data)))))

;; void *fluid_preset_get_data(fluid_preset_t *preset);
(define-public fluid_preset_get_data
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_preset_get_data")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; const char *fluid_preset_get_name(fluid_preset_t *preset);
(define-public fluid_preset_get_name
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_preset_get_name")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; int fluid_preset_get_banknum(fluid_preset_t *preset);
(define-public fluid_preset_get_banknum
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_preset_get_banknum")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; int fluid_preset_get_num(fluid_preset_t *preset);
(define-public fluid_preset_get_num
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_preset_get_num")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; fluid_sfont_t *fluid_preset_get_sfont(fluid_preset_t *preset);
(define-public fluid_preset_get_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_preset_get_sfont")
                       (list '*)))))
    (lambda (preset)
      (let ((preset (cdata-arg->pointer preset))) ((force ~proc) preset)))))

;; fluid_sample_t *new_fluid_sample(void);
(define-public new_fluid_sample
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_sample")
                       (list)))))
    (lambda () (let () ((force ~proc))))))

;; void delete_fluid_sample(fluid_sample_t *sample);
(define-public delete_fluid_sample
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_sample")
                       (list '*)))))
    (lambda (sample)
      (let ((sample (cdata-arg->pointer sample))) ((force ~proc) sample)))))

;; size_t fluid_sample_sizeof(void);
(define-public fluid_sample_sizeof
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:size_t
                       (foreign-pointer-search "fluid_sample_sizeof")
                       (list)))))
    (lambda () (let () ((force ~proc))))))

;; int fluid_sample_set_name(fluid_sample_t *sample, const char *name);
(define-public fluid_sample_set_name
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sample_set_name")
                       (list '* '*)))))
    (lambda (sample name)
      (let ((sample (cdata-arg->pointer sample))
            (name (cdata-arg->pointer name)))
        ((force ~proc) sample name)))))

;; int fluid_sample_set_sound_data(fluid_sample_t *sample, short *data, char *
;;     data24, unsigned nbframes, unsigned sample_rate, short copy_data);
(define-public fluid_sample_set_sound_data
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sample_set_sound_data")
                       (list '*
                             '*
                             '*
                             ffi:unsigned-int
                             ffi:unsigned-int
                             ffi:short)))))
    (lambda (sample data data24 nbframes sample_rate copy_data)
      (let ((sample (cdata-arg->pointer sample))
            (data (cdata-arg->pointer data))
            (data24 (cdata-arg->pointer data24))
            (nbframes (cdata-arg->number nbframes))
            (sample_rate (cdata-arg->number sample_rate))
            (copy_data (cdata-arg->number copy_data)))
        ((force ~proc) sample data data24 nbframes sample_rate copy_data)))))

;; int fluid_sample_set_loop(fluid_sample_t *sample, unsigned loop_start, 
;;     unsigned loop_end);
(define-public fluid_sample_set_loop
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sample_set_loop")
                       (list '* ffi:unsigned-int ffi:unsigned-int)))))
    (lambda (sample loop_start loop_end)
      (let ((sample (cdata-arg->pointer sample))
            (loop_start (cdata-arg->number loop_start))
            (loop_end (cdata-arg->number loop_end)))
        ((force ~proc) sample loop_start loop_end)))))

;; int fluid_sample_set_pitch(fluid_sample_t *sample, int root_key, int 
;;     fine_tune);
(define-public fluid_sample_set_pitch
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_sample_set_pitch")
                       (list '* ffi:int ffi:int)))))
    (lambda (sample root_key fine_tune)
      (let ((sample (cdata-arg->pointer sample))
            (root_key (cdata-arg->number root_key))
            (fine_tune (cdata-arg->number fine_tune)))
        ((force ~proc) sample root_key fine_tune)))))

;; access to enum symbols and #define'd constants:
(define f-synth-ffi-sfont-symbol-tab
  '((FLUID_SAMPLETYPE_ROM . 32768)
    (FLUID_SAMPLETYPE_OGG_VORBIS . 16)
    (FLUID_SAMPLETYPE_LINKED . 8)
    (FLUID_SAMPLETYPE_LEFT . 4)
    (FLUID_SAMPLETYPE_RIGHT . 2)
    (FLUID_SAMPLETYPE_MONO . 1)
    (FLUID_PRESET_UNPIN . 4)
    (FLUID_PRESET_PIN . 3)
    (FLUID_SAMPLE_DONE . 2)
    (FLUID_PRESET_UNSELECTED . 1)
    (FLUID_PRESET_SELECTED . 0)
    (BUILD_SHARED_LIBS . 1)))
(export f-synth-ffi-sfont-symbol-tab)

(define f-synth-ffi-sfont-symbol-val
  (lambda (k) (or (assq-ref f-synth-ffi-sfont-symbol-tab k))))
(export f-synth-ffi-sfont-symbol-val)

(define (unwrap~enum arg)
  (cond
    ((number? arg) arg)
    ((symbol? arg) (f-synth-ffi-sfont-symbol-val arg))
    ((cdata? arg) (cdata-ref arg))
    (else (error "type mismatch"))))

(define f-synth-ffi-sfont-types
  '((enum . "fluid_sample_type") "fluid_sfloader_load_t" 
    "fluid_sfloader_free_t" "fluid_sfloader_callback_open_t" 
    "fluid_sfloader_callback_read_t" "fluid_sfloader_callback_seek_t" 
    "fluid_sfloader_callback_close_t" "fluid_sfloader_callback_tell_t" 
    "fluid_sfont_get_name_t" "fluid_sfont_get_preset_t" 
    "fluid_sfont_iteration_start_t" "fluid_sfont_iteration_next_t" 
    "fluid_sfont_free_t" "fluid_preset_get_name_t" 
    "fluid_preset_get_banknum_t" "fluid_preset_get_num_t" 
    "fluid_preset_noteon_t" "fluid_preset_free_t"))
(export f-synth-ffi-sfont-types)

;; --- last line ---
