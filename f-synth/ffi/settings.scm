;; generated with `guild compile-ffi f-synth/ffi/settings.ffi'
;; using nyacc version 3.00.0

(define-module (f-synth ffi settings)
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


;; enum fluid_types_enum {
;;   FLUID_NO_TYPE = -1,
;;   FLUID_NUM_TYPE,
;;   FLUID_INT_TYPE,
;;   FLUID_STR_TYPE,
;;   FLUID_SET_TYPE,
;; };
(define-public enum-fluid_types_enum
  (name-ctype
   'enum-fluid_types_enum
   (cenum '((FLUID_NO_TYPE -1)
            (FLUID_NUM_TYPE 0)
            (FLUID_INT_TYPE 1)
            (FLUID_STR_TYPE 2)
            (FLUID_SET_TYPE 3)))))
(define-public unwrap-enum-fluid_types_enum
  (let ((numf (cenum-numf (ctype-info enum-fluid_types_enum))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_types_enum
  (let ((symf (cenum-symf (ctype-info enum-fluid_types_enum))))
    (lambda (arg) (or (symf arg) arg))))

;; fluid_settings_t *new_fluid_settings(void);
(define-public new_fluid_settings
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_settings")
                       (list)))))
    (lambda () (let () ((force ~proc))))))

;; void delete_fluid_settings(fluid_settings_t *settings);
(define-public delete_fluid_settings
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_settings")
                       (list '*)))))
    (lambda (settings)
      (let ((settings (cdata-arg->pointer settings))) ((force ~proc) settings)))))

;; int fluid_settings_get_type(fluid_settings_t *settings, const char *name);
(define-public fluid_settings_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_get_type")
                       (list '* '*)))))
    (lambda (settings name)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name)))
        ((force ~proc) settings name)))))

;; int fluid_settings_get_hints(fluid_settings_t *settings, const char *name, 
;;     int *val);
(define-public fluid_settings_get_hints
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_get_hints")
                       (list '* '* '*)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->pointer val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_is_realtime(fluid_settings_t *settings, const char *name)
;;     ;
(define-public fluid_settings_is_realtime
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_is_realtime")
                       (list '* '*)))))
    (lambda (settings name)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name)))
        ((force ~proc) settings name)))))

;; int fluid_settings_setstr(fluid_settings_t *settings, const char *name, 
;;     const char *str);
(define-public fluid_settings_setstr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_setstr")
                       (list '* '* '*)))))
    (lambda (settings name str)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (str (cdata-arg->pointer str)))
        ((force ~proc) settings name str)))))

;; int fluid_settings_copystr(fluid_settings_t *settings, const char *name, 
;;     char *str, int len);
(define-public fluid_settings_copystr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_copystr")
                       (list '* '* '* ffi:int)))))
    (lambda (settings name str len)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (str (cdata-arg->pointer str))
            (len (cdata-arg->number len)))
        ((force ~proc) settings name str len)))))

;; int fluid_settings_dupstr(fluid_settings_t *settings, const char *name, char
;;      **str);
(define-public fluid_settings_dupstr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_dupstr")
                       (list '* '* '*)))))
    (lambda (settings name str)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (str (cdata-arg->pointer str)))
        ((force ~proc) settings name str)))))

;; int fluid_settings_getstr_default(fluid_settings_t *settings, const char *
;;     name, char **def);
(define-public fluid_settings_getstr_default
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getstr_default")
                       (list '* '* '*)))))
    (lambda (settings name def)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (def (cdata-arg->pointer def)))
        ((force ~proc) settings name def)))))

;; int fluid_settings_str_equal(fluid_settings_t *settings, const char *name, 
;;     const char *value);
(define-public fluid_settings_str_equal
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_str_equal")
                       (list '* '* '*)))))
    (lambda (settings name value)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (value (cdata-arg->pointer value)))
        ((force ~proc) settings name value)))))

;; int fluid_settings_setnum(fluid_settings_t *settings, const char *name, 
;;     double val);
(define-public fluid_settings_setnum
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_setnum")
                       (list '* '* ffi:double)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->number val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getnum(fluid_settings_t *settings, const char *name, 
;;     double *val);
(define-public fluid_settings_getnum
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getnum")
                       (list '* '* '*)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->pointer val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getnum_default(fluid_settings_t *settings, const char *
;;     name, double *val);
(define-public fluid_settings_getnum_default
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getnum_default")
                       (list '* '* '*)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->pointer val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getnum_range(fluid_settings_t *settings, const char *name
;;     , double *min, double *max);
(define-public fluid_settings_getnum_range
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getnum_range")
                       (list '* '* '* '*)))))
    (lambda (settings name min max)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (min (cdata-arg->pointer min))
            (max (cdata-arg->pointer max)))
        ((force ~proc) settings name min max)))))

;; int fluid_settings_setint(fluid_settings_t *settings, const char *name, int 
;;     val);
(define-public fluid_settings_setint
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_setint")
                       (list '* '* ffi:int)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->number val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getint(fluid_settings_t *settings, const char *name, int 
;;     *val);
(define-public fluid_settings_getint
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getint")
                       (list '* '* '*)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->pointer val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getint_default(fluid_settings_t *settings, const char *
;;     name, int *val);
(define-public fluid_settings_getint_default
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getint_default")
                       (list '* '* '*)))))
    (lambda (settings name val)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (val (cdata-arg->pointer val)))
        ((force ~proc) settings name val)))))

;; int fluid_settings_getint_range(fluid_settings_t *settings, const char *name
;;     , int *min, int *max);
(define-public fluid_settings_getint_range
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_getint_range")
                       (list '* '* '* '*)))))
    (lambda (settings name min max)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (min (cdata-arg->pointer min))
            (max (cdata-arg->pointer max)))
        ((force ~proc) settings name min max)))))

;; typedef void (*fluid_settings_foreach_option_t)(void *data, const char *name
;;     , const char *option);
(define *fluid_settings_foreach_option_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:void
      (lambda (data name option) (~proc data name option))
      (list '* '* '*)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '* '* '*))))
       (lambda (data name option)
         (let ((data (cdata-arg->pointer data))
               (name (cdata-arg->pointer name))
               (option (cdata-arg->pointer option)))
           (~proc data name option)))))))
(define-public fluid_settings_foreach_option_t
  (name-ctype
   'fluid_settings_foreach_option_t
   (cpointer *fluid_settings_foreach_option_t)))

;; void fluid_settings_foreach_option(fluid_settings_t *settings, const char *
;;     name, void *data, fluid_settings_foreach_option_t func);
(define-public fluid_settings_foreach_option
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_settings_foreach_option")
                       (list '* '* '* '*)))))
    (lambda (settings name data func)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (data (cdata-arg->pointer data))
            (func (cdata-arg->pointer func fluid_settings_foreach_option_t)))
        ((force ~proc) settings name data func)))))

;; int fluid_settings_option_count(fluid_settings_t *settings, const char *name
;;     );
(define-public fluid_settings_option_count
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_settings_option_count")
                       (list '* '*)))))
    (lambda (settings name)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name)))
        ((force ~proc) settings name)))))

;; char *fluid_settings_option_concat(fluid_settings_t *settings, const char *
;;     name, const char *separator);
(define-public fluid_settings_option_concat
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_settings_option_concat")
                       (list '* '* '*)))))
    (lambda (settings name separator)
      (let ((settings (cdata-arg->pointer settings))
            (name (cdata-arg->pointer name))
            (separator (cdata-arg->pointer separator)))
        ((force ~proc) settings name separator)))))

;; typedef void (*fluid_settings_foreach_t)(void *data, const char *name, int 
;;     type);
(define *fluid_settings_foreach_t
  (cfunction
   (lambda (~proc)
     (ffi:procedure->pointer
      ffi:void
      (lambda (data name type) (~proc data name type))
      (list '* '* ffi:int)))
   (lambda (~fptr)
     (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '* '* ffi:int))))
       (lambda (data name type)
         (let ((data (cdata-arg->pointer data))
               (name (cdata-arg->pointer name))
               (type (cdata-arg->number type)))
           (~proc data name type)))))))
(define-public fluid_settings_foreach_t
  (name-ctype 'fluid_settings_foreach_t (cpointer *fluid_settings_foreach_t)))

;; void fluid_settings_foreach(fluid_settings_t *settings, void *data, 
;;     fluid_settings_foreach_t func);
(define-public fluid_settings_foreach
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_settings_foreach")
                       (list '* '* '*)))))
    (lambda (settings data func)
      (let ((settings (cdata-arg->pointer settings))
            (data (cdata-arg->pointer data))
            (func (cdata-arg->pointer func fluid_settings_foreach_t)))
        ((force ~proc) settings data func)))))

;; access to enum symbols and #define'd constants:
(define f-synth-ffi-settings-symbol-tab
  '((FLUID_SET_TYPE . 3)
    (FLUID_STR_TYPE . 2)
    (FLUID_INT_TYPE . 1)
    (FLUID_NUM_TYPE . 0)
    (FLUID_NO_TYPE . -1)
    (FLUID_HINT_OPTIONLIST . 2)
    (FLUID_HINT_TOGGLED . 4)
    (FLUID_HINT_BOUNDED_ABOVE . 2)
    (FLUID_HINT_BOUNDED_BELOW . 1)
    (BUILD_SHARED_LIBS . 1)))
(export f-synth-ffi-settings-symbol-tab)

(define f-synth-ffi-settings-symbol-val
  (lambda (k) (or (assq-ref f-synth-ffi-settings-symbol-tab k))))
(export f-synth-ffi-settings-symbol-val)

(define (unwrap~enum arg)
  (cond
    ((number? arg) arg)
    ((symbol? arg) (f-synth-ffi-settings-symbol-val arg))
    ((cdata? arg) (cdata-ref arg))
    (else (error "type mismatch"))))

(define f-synth-ffi-settings-types
  '((enum . "fluid_types_enum") "fluid_settings_foreach_option_t" 
    "fluid_settings_foreach_t"))
(export f-synth-ffi-settings-types)

;; --- last line ---
