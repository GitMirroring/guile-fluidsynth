;; generated with `guild compile-ffi f-synth/ffi/types.ffi'
;; using nyacc version 3.00.0

(define-module (f-synth ffi types)
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


;; typedef struct _fluid_hashtable_t fluid_settings_t;
(define-public fluid_settings_t*
  (name-ctype 'fluid_settings_t* (cpointer 'void)))

;; typedef struct _fluid_synth_t fluid_synth_t;
(define-public fluid_synth_t* (name-ctype 'fluid_synth_t* (cpointer 'void)))

;; typedef struct _fluid_voice_t fluid_voice_t;
(define-public fluid_voice_t* (name-ctype 'fluid_voice_t* (cpointer 'void)))

;; typedef struct _fluid_sfloader_t fluid_sfloader_t;
(define-public fluid_sfloader_t*
  (name-ctype 'fluid_sfloader_t* (cpointer 'void)))

;; typedef struct _fluid_sfont_t fluid_sfont_t;
(define-public fluid_sfont_t* (name-ctype 'fluid_sfont_t* (cpointer 'void)))

;; typedef struct _fluid_preset_t fluid_preset_t;
(define-public fluid_preset_t* (name-ctype 'fluid_preset_t* (cpointer 'void)))

;; typedef struct _fluid_sample_t fluid_sample_t;
(define-public fluid_sample_t* (name-ctype 'fluid_sample_t* (cpointer 'void)))

;; typedef struct _fluid_mod_t fluid_mod_t;
(define-public fluid_mod_t* (name-ctype 'fluid_mod_t* (cpointer 'void)))

;; typedef struct _fluid_audio_driver_t fluid_audio_driver_t;
(define-public fluid_audio_driver_t*
  (name-ctype 'fluid_audio_driver_t* (cpointer 'void)))

;; typedef struct _fluid_file_renderer_t fluid_file_renderer_t;
(define-public fluid_file_renderer_t*
  (name-ctype 'fluid_file_renderer_t* (cpointer 'void)))

;; typedef struct _fluid_player_t fluid_player_t;
(define-public fluid_player_t* (name-ctype 'fluid_player_t* (cpointer 'void)))

;; typedef struct _fluid_midi_event_t fluid_midi_event_t;
(define-public fluid_midi_event_t*
  (name-ctype 'fluid_midi_event_t* (cpointer 'void)))

;; typedef struct _fluid_midi_driver_t fluid_midi_driver_t;
(define-public fluid_midi_driver_t*
  (name-ctype 'fluid_midi_driver_t* (cpointer 'void)))

;; typedef struct _fluid_midi_router_t fluid_midi_router_t;
(define-public fluid_midi_router_t*
  (name-ctype 'fluid_midi_router_t* (cpointer 'void)))

;; typedef struct _fluid_midi_router_rule_t fluid_midi_router_rule_t;
(define-public fluid_midi_router_rule_t*
  (name-ctype 'fluid_midi_router_rule_t* (cpointer 'void)))

;; typedef struct _fluid_hashtable_t fluid_cmd_hash_t;
(define-public fluid_cmd_hash_t*
  (name-ctype 'fluid_cmd_hash_t* (cpointer 'void)))

;; typedef struct _fluid_shell_t fluid_shell_t;
(define-public fluid_shell_t* (name-ctype 'fluid_shell_t* (cpointer 'void)))

;; typedef struct _fluid_server_t fluid_server_t;
(define-public fluid_server_t* (name-ctype 'fluid_server_t* (cpointer 'void)))

;; typedef struct _fluid_event_t fluid_event_t;
(define-public fluid_event_t* (name-ctype 'fluid_event_t* (cpointer 'void)))

;; typedef struct _fluid_sequencer_t fluid_sequencer_t;
(define-public fluid_sequencer_t*
  (name-ctype 'fluid_sequencer_t* (cpointer 'void)))

;; typedef struct _fluid_cmd_handler_t fluid_cmd_handler_t;
(define-public fluid_cmd_handler_t*
  (name-ctype 'fluid_cmd_handler_t* (cpointer 'void)))

;; typedef struct _fluid_ladspa_fx_t fluid_ladspa_fx_t;
(define-public fluid_ladspa_fx_t*
  (name-ctype 'fluid_ladspa_fx_t* (cpointer 'void)))

;; typedef struct _fluid_file_callbacks_t fluid_file_callbacks_t;
(define-public fluid_file_callbacks_t*
  (name-ctype 'fluid_file_callbacks_t* (cpointer 'void)))

;; typedef int fluid_istream_t;
(define-public fluid_istream_t (name-ctype 'fluid_istream_t (cbase 'int)))

;; typedef int fluid_ostream_t;
(define-public fluid_ostream_t (name-ctype 'fluid_ostream_t (cbase 'int)))

;; typedef short fluid_seq_id_t;
(define-public fluid_seq_id_t (name-ctype 'fluid_seq_id_t (cbase 'short)))

;; typedef long long fluid_long_long_t;
(define-public fluid_long_long_t
  (name-ctype 'fluid_long_long_t (cbase 'long-long)))

;; access to enum symbols and #define'd constants:
(define f-synth-ffi-types-symbol-tab '((BUILD_SHARED_LIBS . 1)))
(export f-synth-ffi-types-symbol-tab)

(define f-synth-ffi-types-symbol-val
  (lambda (k) (or (assq-ref f-synth-ffi-types-symbol-tab k))))
(export f-synth-ffi-types-symbol-val)

(define (unwrap~enum arg)
  (cond
    ((number? arg) arg)
    ((symbol? arg) (f-synth-ffi-types-symbol-val arg))
    ((cdata? arg) (cdata-ref arg))
    (else (error "type mismatch"))))

(define f-synth-ffi-types-types
  '((pointer . "fluid_settings_t") "fluid_settings_t" (pointer . 
    "fluid_synth_t") "fluid_synth_t" (pointer . "fluid_voice_t") 
    "fluid_voice_t" (pointer . "fluid_sfloader_t") "fluid_sfloader_t" (pointer
    . "fluid_sfont_t") "fluid_sfont_t" (pointer . "fluid_preset_t") 
    "fluid_preset_t" (pointer . "fluid_sample_t") "fluid_sample_t" (pointer . 
    "fluid_mod_t") "fluid_mod_t" (pointer . "fluid_audio_driver_t") 
    "fluid_audio_driver_t" (pointer . "fluid_file_renderer_t") 
    "fluid_file_renderer_t" (pointer . "fluid_player_t") "fluid_player_t" 
    (pointer . "fluid_midi_event_t") "fluid_midi_event_t" (pointer . 
    "fluid_midi_driver_t") "fluid_midi_driver_t" (pointer . 
    "fluid_midi_router_t") "fluid_midi_router_t" (pointer . 
    "fluid_midi_router_rule_t") "fluid_midi_router_rule_t" (pointer . 
    "fluid_cmd_hash_t") "fluid_cmd_hash_t" (pointer . "fluid_shell_t") 
    "fluid_shell_t" (pointer . "fluid_server_t") "fluid_server_t" (pointer . 
    "fluid_event_t") "fluid_event_t" (pointer . "fluid_sequencer_t") 
    "fluid_sequencer_t" (pointer . "fluid_cmd_handler_t") 
    "fluid_cmd_handler_t" (pointer . "fluid_ladspa_fx_t") "fluid_ladspa_fx_t" 
    (pointer . "fluid_file_callbacks_t") "fluid_file_callbacks_t" 
    "fluid_istream_t" "fluid_ostream_t" "fluid_seq_id_t" "fluid_long_long_t"))
(export f-synth-ffi-types-types)

;; --- last line ---
