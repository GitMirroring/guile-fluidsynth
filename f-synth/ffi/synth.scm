;; generated with `guild compile-ffi f-synth/ffi/synth.ffi'
;; using nyacc version 3.00.0

(define-module (f-synth ffi synth)
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


;; fluid_synth_t *new_fluid_synth(fluid_settings_t *settings);
(define-public new_fluid_synth
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "new_fluid_synth")
                       (list '*)))))
    (lambda (settings)
      (let ((settings (cdata-arg->pointer settings))) ((force ~proc) settings)))))

;; void delete_fluid_synth(fluid_synth_t *synth);
(define-public delete_fluid_synth
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "delete_fluid_synth")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_cpu_load(fluid_synth_t *synth);
(define-public fluid_synth_get_cpu_load
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_cpu_load")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; const char *fluid_synth_error(fluid_synth_t *synth);
(define-public fluid_synth_error
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_error")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_noteon(fluid_synth_t *synth, int chan, int key, int vel);
(define-public fluid_synth_noteon
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_noteon")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth chan key vel)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (key (cdata-arg->number key))
            (vel (cdata-arg->number vel)))
        ((force ~proc) synth chan key vel)))))

;; int fluid_synth_noteoff(fluid_synth_t *synth, int chan, int key);
(define-public fluid_synth_noteoff
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_noteoff")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan key)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (key (cdata-arg->number key)))
        ((force ~proc) synth chan key)))))

;; int fluid_synth_cc(fluid_synth_t *synth, int chan, int ctrl, int val);
(define-public fluid_synth_cc
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_cc")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth chan ctrl val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (ctrl (cdata-arg->number ctrl))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan ctrl val)))))

;; int fluid_synth_get_cc(fluid_synth_t *synth, int chan, int ctrl, int *pval);
;;     
(define-public fluid_synth_get_cc
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_cc")
                       (list '* ffi:int ffi:int '*)))))
    (lambda (synth chan ctrl pval)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (ctrl (cdata-arg->number ctrl))
            (pval (cdata-arg->pointer pval)))
        ((force ~proc) synth chan ctrl pval)))))

;; int fluid_synth_sysex(fluid_synth_t *synth, const char *data, int len, char 
;;     *response, int *response_len, int *handled, int dryrun);
(define-public fluid_synth_sysex
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sysex")
                       (list '* '* ffi:int '* '* '* ffi:int)))))
    (lambda (synth data len response response_len handled dryrun)
      (let ((synth (cdata-arg->pointer synth))
            (data (cdata-arg->pointer data))
            (len (cdata-arg->number len))
            (response (cdata-arg->pointer response))
            (response_len (cdata-arg->pointer response_len))
            (handled (cdata-arg->pointer handled))
            (dryrun (cdata-arg->number dryrun)))
        ((force ~proc) synth data len response response_len handled dryrun)))))

;; int fluid_synth_pitch_bend(fluid_synth_t *synth, int chan, int val);
(define-public fluid_synth_pitch_bend
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_pitch_bend")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan val)))))

;; int fluid_synth_get_pitch_bend(fluid_synth_t *synth, int chan, int *
;;     ppitch_bend);
(define-public fluid_synth_get_pitch_bend
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_pitch_bend")
                       (list '* ffi:int '*)))))
    (lambda (synth chan ppitch_bend)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (ppitch_bend (cdata-arg->pointer ppitch_bend)))
        ((force ~proc) synth chan ppitch_bend)))))

;; int fluid_synth_pitch_wheel_sens(fluid_synth_t *synth, int chan, int val);
(define-public fluid_synth_pitch_wheel_sens
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_pitch_wheel_sens")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan val)))))

;; int fluid_synth_get_pitch_wheel_sens(fluid_synth_t *synth, int chan, int *
;;     pval);
(define-public fluid_synth_get_pitch_wheel_sens
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_pitch_wheel_sens")
                       (list '* ffi:int '*)))))
    (lambda (synth chan pval)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (pval (cdata-arg->pointer pval)))
        ((force ~proc) synth chan pval)))))

;; int fluid_synth_program_change(fluid_synth_t *synth, int chan, int program);
;;     
(define-public fluid_synth_program_change
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_program_change")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan program)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (program (cdata-arg->number program)))
        ((force ~proc) synth chan program)))))

;; int fluid_synth_channel_pressure(fluid_synth_t *synth, int chan, int val);
(define-public fluid_synth_channel_pressure
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_channel_pressure")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan val)))))

;; int fluid_synth_key_pressure(fluid_synth_t *synth, int chan, int key, int 
;;     val);
(define-public fluid_synth_key_pressure
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_key_pressure")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth chan key val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (key (cdata-arg->number key))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan key val)))))

;; int fluid_synth_bank_select(fluid_synth_t *synth, int chan, int bank);
(define-public fluid_synth_bank_select
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_bank_select")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan bank)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (bank (cdata-arg->number bank)))
        ((force ~proc) synth chan bank)))))

;; int fluid_synth_sfont_select(fluid_synth_t *synth, int chan, int sfont_id);
(define-public fluid_synth_sfont_select
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sfont_select")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan sfont_id)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (sfont_id (cdata-arg->number sfont_id)))
        ((force ~proc) synth chan sfont_id)))))

;; int fluid_synth_program_select(fluid_synth_t *synth, int chan, int sfont_id
;;     , int bank_num, int preset_num);
(define-public fluid_synth_program_select
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_program_select")
                       (list '* ffi:int ffi:int ffi:int ffi:int)))))
    (lambda (synth chan sfont_id bank_num preset_num)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (sfont_id (cdata-arg->number sfont_id))
            (bank_num (cdata-arg->number bank_num))
            (preset_num (cdata-arg->number preset_num)))
        ((force ~proc) synth chan sfont_id bank_num preset_num)))))

;; int fluid_synth_program_select_by_sfont_name(fluid_synth_t *synth, int chan
;;     , const char *sfont_name, int bank_num, int preset_num);
(define-public fluid_synth_program_select_by_sfont_name
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_program_select_by_sfont_name")
                       (list '* ffi:int '* ffi:int ffi:int)))))
    (lambda (synth chan sfont_name bank_num preset_num)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (sfont_name (cdata-arg->pointer sfont_name))
            (bank_num (cdata-arg->number bank_num))
            (preset_num (cdata-arg->number preset_num)))
        ((force ~proc) synth chan sfont_name bank_num preset_num)))))

;; int fluid_synth_get_program(fluid_synth_t *synth, int chan, int *sfont_id, 
;;     int *bank_num, int *preset_num);
(define-public fluid_synth_get_program
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_program")
                       (list '* ffi:int '* '* '*)))))
    (lambda (synth chan sfont_id bank_num preset_num)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (sfont_id (cdata-arg->pointer sfont_id))
            (bank_num (cdata-arg->pointer bank_num))
            (preset_num (cdata-arg->pointer preset_num)))
        ((force ~proc) synth chan sfont_id bank_num preset_num)))))

;; int fluid_synth_unset_program(fluid_synth_t *synth, int chan);
(define-public fluid_synth_unset_program
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_unset_program")
                       (list '* ffi:int)))))
    (lambda (synth chan)
      (let ((synth (cdata-arg->pointer synth)) (chan (cdata-arg->number chan)))
        ((force ~proc) synth chan)))))

;; int fluid_synth_program_reset(fluid_synth_t *synth);
(define-public fluid_synth_program_reset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_program_reset")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_system_reset(fluid_synth_t *synth);
(define-public fluid_synth_system_reset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_system_reset")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_all_notes_off(fluid_synth_t *synth, int chan);
(define-public fluid_synth_all_notes_off
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_all_notes_off")
                       (list '* ffi:int)))))
    (lambda (synth chan)
      (let ((synth (cdata-arg->pointer synth)) (chan (cdata-arg->number chan)))
        ((force ~proc) synth chan)))))

;; int fluid_synth_all_sounds_off(fluid_synth_t *synth, int chan);
(define-public fluid_synth_all_sounds_off
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_all_sounds_off")
                       (list '* ffi:int)))))
    (lambda (synth chan)
      (let ((synth (cdata-arg->pointer synth)) (chan (cdata-arg->number chan)))
        ((force ~proc) synth chan)))))

;; int fluid_synth_set_gen(fluid_synth_t *synth, int chan, int param, float 
;;     value);
(define-public fluid_synth_set_gen
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_gen")
                       (list '* ffi:int ffi:int ffi:float)))))
    (lambda (synth chan param value)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (param (cdata-arg->number param))
            (value (cdata-arg->number value)))
        ((force ~proc) synth chan param value)))))

;; float fluid_synth_get_gen(fluid_synth_t *synth, int chan, int param);
(define-public fluid_synth_get_gen
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:float
                       (foreign-pointer-search "fluid_synth_get_gen")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan param)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (param (cdata-arg->number param)))
        ((force ~proc) synth chan param)))))

;; int fluid_synth_start(fluid_synth_t *synth, unsigned id, fluid_preset_t *
;;     preset, int audio_chan, int midi_chan, int key, int vel);
(define-public fluid_synth_start
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_start")
                       (list '*
                             ffi:unsigned-int
                             '*
                             ffi:int
                             ffi:int
                             ffi:int
                             ffi:int)))))
    (lambda (synth id preset audio_chan midi_chan key vel)
      (let ((synth (cdata-arg->pointer synth))
            (id (cdata-arg->number id))
            (preset (cdata-arg->pointer preset))
            (audio_chan (cdata-arg->number audio_chan))
            (midi_chan (cdata-arg->number midi_chan))
            (key (cdata-arg->number key))
            (vel (cdata-arg->number vel)))
        ((force ~proc) synth id preset audio_chan midi_chan key vel)))))

;; int fluid_synth_stop(fluid_synth_t *synth, unsigned id);
(define-public fluid_synth_stop
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_stop")
                       (list '* ffi:unsigned-int)))))
    (lambda (synth id)
      (let ((synth (cdata-arg->pointer synth)) (id (cdata-arg->number id)))
        ((force ~proc) synth id)))))

;; fluid_voice_t *fluid_synth_alloc_voice(fluid_synth_t *synth, fluid_sample_t 
;;     *sample, int channum, int key, int vel);
(define-public fluid_synth_alloc_voice
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_alloc_voice")
                       (list '* '* ffi:int ffi:int ffi:int)))))
    (lambda (synth sample channum key vel)
      (let ((synth (cdata-arg->pointer synth))
            (sample (cdata-arg->pointer sample))
            (channum (cdata-arg->number channum))
            (key (cdata-arg->number key))
            (vel (cdata-arg->number vel)))
        ((force ~proc) synth sample channum key vel)))))

;; void fluid_synth_start_voice(fluid_synth_t *synth, fluid_voice_t *voice);
(define-public fluid_synth_start_voice
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_start_voice")
                       (list '* '*)))))
    (lambda (synth voice)
      (let ((synth (cdata-arg->pointer synth))
            (voice (cdata-arg->pointer voice)))
        ((force ~proc) synth voice)))))

;; void fluid_synth_get_voicelist(fluid_synth_t *synth, fluid_voice_t *buf[], 
;;     int bufsize, int ID);
(define-public fluid_synth_get_voicelist
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_get_voicelist")
                       (list '* (make-list #f '*) ffi:int ffi:int)))))
    (lambda (synth buf bufsize ID)
      (let ((synth (cdata-arg->pointer synth))
            (buf (cdata-arg->pointer buf))
            (bufsize (cdata-arg->number bufsize))
            (ID (cdata-arg->number ID)))
        ((force ~proc) synth buf bufsize ID)))))

;; int fluid_synth_sfload(fluid_synth_t *synth, const char *filename, int 
;;     reset_presets);
(define-public fluid_synth_sfload
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sfload")
                       (list '* '* ffi:int)))))
    (lambda (synth filename reset_presets)
      (let ((synth (cdata-arg->pointer synth))
            (filename (cdata-arg->pointer filename))
            (reset_presets (cdata-arg->number reset_presets)))
        ((force ~proc) synth filename reset_presets)))))

;; int fluid_synth_sfreload(fluid_synth_t *synth, int id);
(define-public fluid_synth_sfreload
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sfreload")
                       (list '* ffi:int)))))
    (lambda (synth id)
      (let ((synth (cdata-arg->pointer synth)) (id (cdata-arg->number id)))
        ((force ~proc) synth id)))))

;; int fluid_synth_sfunload(fluid_synth_t *synth, int id, int reset_presets);
(define-public fluid_synth_sfunload
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sfunload")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth id reset_presets)
      (let ((synth (cdata-arg->pointer synth))
            (id (cdata-arg->number id))
            (reset_presets (cdata-arg->number reset_presets)))
        ((force ~proc) synth id reset_presets)))))

;; int fluid_synth_add_sfont(fluid_synth_t *synth, fluid_sfont_t *sfont);
(define-public fluid_synth_add_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_add_sfont")
                       (list '* '*)))))
    (lambda (synth sfont)
      (let ((synth (cdata-arg->pointer synth))
            (sfont (cdata-arg->pointer sfont)))
        ((force ~proc) synth sfont)))))

;; int fluid_synth_remove_sfont(fluid_synth_t *synth, fluid_sfont_t *sfont);
(define-public fluid_synth_remove_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_remove_sfont")
                       (list '* '*)))))
    (lambda (synth sfont)
      (let ((synth (cdata-arg->pointer synth))
            (sfont (cdata-arg->pointer sfont)))
        ((force ~proc) synth sfont)))))

;; int fluid_synth_sfcount(fluid_synth_t *synth);
(define-public fluid_synth_sfcount
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_sfcount")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; fluid_sfont_t *fluid_synth_get_sfont(fluid_synth_t *synth, unsigned num);
(define-public fluid_synth_get_sfont
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_get_sfont")
                       (list '* ffi:unsigned-int)))))
    (lambda (synth num)
      (let ((synth (cdata-arg->pointer synth)) (num (cdata-arg->number num)))
        ((force ~proc) synth num)))))

;; fluid_sfont_t *fluid_synth_get_sfont_by_id(fluid_synth_t *synth, int id);
(define-public fluid_synth_get_sfont_by_id
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_get_sfont_by_id")
                       (list '* ffi:int)))))
    (lambda (synth id)
      (let ((synth (cdata-arg->pointer synth)) (id (cdata-arg->number id)))
        ((force ~proc) synth id)))))

;; fluid_sfont_t *fluid_synth_get_sfont_by_name(fluid_synth_t *synth, const 
;;     char *name);
(define-public fluid_synth_get_sfont_by_name
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_get_sfont_by_name")
                       (list '* '*)))))
    (lambda (synth name)
      (let ((synth (cdata-arg->pointer synth))
            (name (cdata-arg->pointer name)))
        ((force ~proc) synth name)))))

;; int fluid_synth_set_bank_offset(fluid_synth_t *synth, int sfont_id, int 
;;     offset);
(define-public fluid_synth_set_bank_offset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_bank_offset")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth sfont_id offset)
      (let ((synth (cdata-arg->pointer synth))
            (sfont_id (cdata-arg->number sfont_id))
            (offset (cdata-arg->number offset)))
        ((force ~proc) synth sfont_id offset)))))

;; int fluid_synth_get_bank_offset(fluid_synth_t *synth, int sfont_id);
(define-public fluid_synth_get_bank_offset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_bank_offset")
                       (list '* ffi:int)))))
    (lambda (synth sfont_id)
      (let ((synth (cdata-arg->pointer synth))
            (sfont_id (cdata-arg->number sfont_id)))
        ((force ~proc) synth sfont_id)))))

;; void fluid_synth_set_reverb_on(fluid_synth_t *synth, int on);
(define-public fluid_synth_set_reverb_on
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_set_reverb_on")
                       (list '* ffi:int)))))
    (lambda (synth on)
      (let ((synth (cdata-arg->pointer synth)) (on (cdata-arg->number on)))
        ((force ~proc) synth on)))))

;; int fluid_synth_reverb_on(fluid_synth_t *synth, int fx_group, int on);
(define-public fluid_synth_reverb_on
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_reverb_on")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth fx_group on)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (on (cdata-arg->number on)))
        ((force ~proc) synth fx_group on)))))

;; int fluid_synth_set_reverb(fluid_synth_t *synth, double roomsize, double 
;;     damping, double width, double level);
(define-public fluid_synth_set_reverb
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_reverb")
                       (list '* ffi:double ffi:double ffi:double ffi:double)))))
    (lambda (synth roomsize damping width level)
      (let ((synth (cdata-arg->pointer synth))
            (roomsize (cdata-arg->number roomsize))
            (damping (cdata-arg->number damping))
            (width (cdata-arg->number width))
            (level (cdata-arg->number level)))
        ((force ~proc) synth roomsize damping width level)))))

;; int fluid_synth_set_reverb_roomsize(fluid_synth_t *synth, double roomsize);
(define-public fluid_synth_set_reverb_roomsize
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_reverb_roomsize")
                       (list '* ffi:double)))))
    (lambda (synth roomsize)
      (let ((synth (cdata-arg->pointer synth))
            (roomsize (cdata-arg->number roomsize)))
        ((force ~proc) synth roomsize)))))

;; int fluid_synth_set_reverb_damp(fluid_synth_t *synth, double damping);
(define-public fluid_synth_set_reverb_damp
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_reverb_damp")
                       (list '* ffi:double)))))
    (lambda (synth damping)
      (let ((synth (cdata-arg->pointer synth))
            (damping (cdata-arg->number damping)))
        ((force ~proc) synth damping)))))

;; int fluid_synth_set_reverb_width(fluid_synth_t *synth, double width);
(define-public fluid_synth_set_reverb_width
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_reverb_width")
                       (list '* ffi:double)))))
    (lambda (synth width)
      (let ((synth (cdata-arg->pointer synth))
            (width (cdata-arg->number width)))
        ((force ~proc) synth width)))))

;; int fluid_synth_set_reverb_level(fluid_synth_t *synth, double level);
(define-public fluid_synth_set_reverb_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_reverb_level")
                       (list '* ffi:double)))))
    (lambda (synth level)
      (let ((synth (cdata-arg->pointer synth))
            (level (cdata-arg->number level)))
        ((force ~proc) synth level)))))

;; double fluid_synth_get_reverb_roomsize(fluid_synth_t *synth);
(define-public fluid_synth_get_reverb_roomsize
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search
                        "fluid_synth_get_reverb_roomsize")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_reverb_damp(fluid_synth_t *synth);
(define-public fluid_synth_get_reverb_damp
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_reverb_damp")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_reverb_level(fluid_synth_t *synth);
(define-public fluid_synth_get_reverb_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_reverb_level")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_reverb_width(fluid_synth_t *synth);
(define-public fluid_synth_get_reverb_width
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_reverb_width")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_set_reverb_group_roomsize(fluid_synth_t *synth, int fx_group
;;     , double roomsize);
(define-public fluid_synth_set_reverb_group_roomsize
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_reverb_group_roomsize")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group roomsize)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (roomsize (cdata-arg->number roomsize)))
        ((force ~proc) synth fx_group roomsize)))))

;; int fluid_synth_set_reverb_group_damp(fluid_synth_t *synth, int fx_group, 
;;     double damping);
(define-public fluid_synth_set_reverb_group_damp
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_reverb_group_damp")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group damping)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (damping (cdata-arg->number damping)))
        ((force ~proc) synth fx_group damping)))))

;; int fluid_synth_set_reverb_group_width(fluid_synth_t *synth, int fx_group, 
;;     double width);
(define-public fluid_synth_set_reverb_group_width
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_reverb_group_width")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group width)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (width (cdata-arg->number width)))
        ((force ~proc) synth fx_group width)))))

;; int fluid_synth_set_reverb_group_level(fluid_synth_t *synth, int fx_group, 
;;     double level);
(define-public fluid_synth_set_reverb_group_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_reverb_group_level")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group level)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (level (cdata-arg->number level)))
        ((force ~proc) synth fx_group level)))))

;; int fluid_synth_get_reverb_group_roomsize(fluid_synth_t *synth, int fx_group
;;     , double *roomsize);
(define-public fluid_synth_get_reverb_group_roomsize
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_reverb_group_roomsize")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group roomsize)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (roomsize (cdata-arg->pointer roomsize)))
        ((force ~proc) synth fx_group roomsize)))))

;; int fluid_synth_get_reverb_group_damp(fluid_synth_t *synth, int fx_group, 
;;     double *damping);
(define-public fluid_synth_get_reverb_group_damp
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_reverb_group_damp")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group damping)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (damping (cdata-arg->pointer damping)))
        ((force ~proc) synth fx_group damping)))))

;; int fluid_synth_get_reverb_group_width(fluid_synth_t *synth, int fx_group, 
;;     double *width);
(define-public fluid_synth_get_reverb_group_width
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_reverb_group_width")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group width)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (width (cdata-arg->pointer width)))
        ((force ~proc) synth fx_group width)))))

;; int fluid_synth_get_reverb_group_level(fluid_synth_t *synth, int fx_group, 
;;     double *level);
(define-public fluid_synth_get_reverb_group_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_reverb_group_level")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group level)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (level (cdata-arg->pointer level)))
        ((force ~proc) synth fx_group level)))))

;; enum fluid_chorus_mod {
;;   FLUID_CHORUS_MOD_SINE = 0,
;;   FLUID_CHORUS_MOD_TRIANGLE = 1,
;; };
(define-public enum-fluid_chorus_mod
  (name-ctype
   'enum-fluid_chorus_mod
   (cenum '((FLUID_CHORUS_MOD_SINE 0) (FLUID_CHORUS_MOD_TRIANGLE 1)))))
(define-public unwrap-enum-fluid_chorus_mod
  (let ((numf (cenum-numf (ctype-info enum-fluid_chorus_mod))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_chorus_mod
  (let ((symf (cenum-symf (ctype-info enum-fluid_chorus_mod))))
    (lambda (arg) (or (symf arg) arg))))

;; void fluid_synth_set_chorus_on(fluid_synth_t *synth, int on);
(define-public fluid_synth_set_chorus_on
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_set_chorus_on")
                       (list '* ffi:int)))))
    (lambda (synth on)
      (let ((synth (cdata-arg->pointer synth)) (on (cdata-arg->number on)))
        ((force ~proc) synth on)))))

;; int fluid_synth_chorus_on(fluid_synth_t *synth, int fx_group, int on);
(define-public fluid_synth_chorus_on
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_chorus_on")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth fx_group on)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (on (cdata-arg->number on)))
        ((force ~proc) synth fx_group on)))))

;; int fluid_synth_set_chorus(fluid_synth_t *synth, int nr, double level, 
;;     double speed, double depth_ms, int type);
(define-public fluid_synth_set_chorus
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus")
                       (list '*
                             ffi:int
                             ffi:double
                             ffi:double
                             ffi:double
                             ffi:int)))))
    (lambda (synth nr level speed depth_ms type)
      (let ((synth (cdata-arg->pointer synth))
            (nr (cdata-arg->number nr))
            (level (cdata-arg->number level))
            (speed (cdata-arg->number speed))
            (depth_ms (cdata-arg->number depth_ms))
            (type (cdata-arg->number type)))
        ((force ~proc) synth nr level speed depth_ms type)))))

;; int fluid_synth_set_chorus_nr(fluid_synth_t *synth, int nr);
(define-public fluid_synth_set_chorus_nr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus_nr")
                       (list '* ffi:int)))))
    (lambda (synth nr)
      (let ((synth (cdata-arg->pointer synth)) (nr (cdata-arg->number nr)))
        ((force ~proc) synth nr)))))

;; int fluid_synth_set_chorus_level(fluid_synth_t *synth, double level);
(define-public fluid_synth_set_chorus_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus_level")
                       (list '* ffi:double)))))
    (lambda (synth level)
      (let ((synth (cdata-arg->pointer synth))
            (level (cdata-arg->number level)))
        ((force ~proc) synth level)))))

;; int fluid_synth_set_chorus_speed(fluid_synth_t *synth, double speed);
(define-public fluid_synth_set_chorus_speed
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus_speed")
                       (list '* ffi:double)))))
    (lambda (synth speed)
      (let ((synth (cdata-arg->pointer synth))
            (speed (cdata-arg->number speed)))
        ((force ~proc) synth speed)))))

;; int fluid_synth_set_chorus_depth(fluid_synth_t *synth, double depth_ms);
(define-public fluid_synth_set_chorus_depth
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus_depth")
                       (list '* ffi:double)))))
    (lambda (synth depth_ms)
      (let ((synth (cdata-arg->pointer synth))
            (depth_ms (cdata-arg->number depth_ms)))
        ((force ~proc) synth depth_ms)))))

;; int fluid_synth_set_chorus_type(fluid_synth_t *synth, int type);
(define-public fluid_synth_set_chorus_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_chorus_type")
                       (list '* ffi:int)))))
    (lambda (synth type)
      (let ((synth (cdata-arg->pointer synth)) (type (cdata-arg->number type)))
        ((force ~proc) synth type)))))

;; int fluid_synth_get_chorus_nr(fluid_synth_t *synth);
(define-public fluid_synth_get_chorus_nr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_chorus_nr")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_chorus_level(fluid_synth_t *synth);
(define-public fluid_synth_get_chorus_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_chorus_level")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_chorus_speed(fluid_synth_t *synth);
(define-public fluid_synth_get_chorus_speed
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_chorus_speed")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; double fluid_synth_get_chorus_depth(fluid_synth_t *synth);
(define-public fluid_synth_get_chorus_depth
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:double
                       (foreign-pointer-search "fluid_synth_get_chorus_depth")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_get_chorus_type(fluid_synth_t *synth);
(define-public fluid_synth_get_chorus_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_chorus_type")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_set_chorus_group_nr(fluid_synth_t *synth, int fx_group, int 
;;     nr);
(define-public fluid_synth_set_chorus_group_nr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_chorus_group_nr")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth fx_group nr)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (nr (cdata-arg->number nr)))
        ((force ~proc) synth fx_group nr)))))

;; int fluid_synth_set_chorus_group_level(fluid_synth_t *synth, int fx_group, 
;;     double level);
(define-public fluid_synth_set_chorus_group_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_chorus_group_level")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group level)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (level (cdata-arg->number level)))
        ((force ~proc) synth fx_group level)))))

;; int fluid_synth_set_chorus_group_speed(fluid_synth_t *synth, int fx_group, 
;;     double speed);
(define-public fluid_synth_set_chorus_group_speed
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_chorus_group_speed")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group speed)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (speed (cdata-arg->number speed)))
        ((force ~proc) synth fx_group speed)))))

;; int fluid_synth_set_chorus_group_depth(fluid_synth_t *synth, int fx_group, 
;;     double depth_ms);
(define-public fluid_synth_set_chorus_group_depth
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_chorus_group_depth")
                       (list '* ffi:int ffi:double)))))
    (lambda (synth fx_group depth_ms)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (depth_ms (cdata-arg->number depth_ms)))
        ((force ~proc) synth fx_group depth_ms)))))

;; int fluid_synth_set_chorus_group_type(fluid_synth_t *synth, int fx_group, 
;;     int type);
(define-public fluid_synth_set_chorus_group_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_chorus_group_type")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth fx_group type)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (type (cdata-arg->number type)))
        ((force ~proc) synth fx_group type)))))

;; int fluid_synth_get_chorus_group_nr(fluid_synth_t *synth, int fx_group, int 
;;     *nr);
(define-public fluid_synth_get_chorus_group_nr
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_chorus_group_nr")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group nr)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (nr (cdata-arg->pointer nr)))
        ((force ~proc) synth fx_group nr)))))

;; int fluid_synth_get_chorus_group_level(fluid_synth_t *synth, int fx_group, 
;;     double *level);
(define-public fluid_synth_get_chorus_group_level
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_chorus_group_level")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group level)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (level (cdata-arg->pointer level)))
        ((force ~proc) synth fx_group level)))))

;; int fluid_synth_get_chorus_group_speed(fluid_synth_t *synth, int fx_group, 
;;     double *speed);
(define-public fluid_synth_get_chorus_group_speed
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_chorus_group_speed")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group speed)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (speed (cdata-arg->pointer speed)))
        ((force ~proc) synth fx_group speed)))))

;; int fluid_synth_get_chorus_group_depth(fluid_synth_t *synth, int fx_group, 
;;     double *depth_ms);
(define-public fluid_synth_get_chorus_group_depth
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_chorus_group_depth")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group depth_ms)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (depth_ms (cdata-arg->pointer depth_ms)))
        ((force ~proc) synth fx_group depth_ms)))))

;; int fluid_synth_get_chorus_group_type(fluid_synth_t *synth, int fx_group, 
;;     int *type);
(define-public fluid_synth_get_chorus_group_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_chorus_group_type")
                       (list '* ffi:int '*)))))
    (lambda (synth fx_group type)
      (let ((synth (cdata-arg->pointer synth))
            (fx_group (cdata-arg->number fx_group))
            (type (cdata-arg->pointer type)))
        ((force ~proc) synth fx_group type)))))

;; int fluid_synth_count_midi_channels(fluid_synth_t *synth);
(define-public fluid_synth_count_midi_channels
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_count_midi_channels")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_count_audio_channels(fluid_synth_t *synth);
(define-public fluid_synth_count_audio_channels
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_count_audio_channels")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_count_audio_groups(fluid_synth_t *synth);
(define-public fluid_synth_count_audio_groups
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_count_audio_groups")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_count_effects_channels(fluid_synth_t *synth);
(define-public fluid_synth_count_effects_channels
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_count_effects_channels")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_count_effects_groups(fluid_synth_t *synth);
(define-public fluid_synth_count_effects_groups
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_count_effects_groups")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; void fluid_synth_set_sample_rate(fluid_synth_t *synth, float sample_rate);
(define-public fluid_synth_set_sample_rate
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_set_sample_rate")
                       (list '* ffi:float)))))
    (lambda (synth sample_rate)
      (let ((synth (cdata-arg->pointer synth))
            (sample_rate (cdata-arg->number sample_rate)))
        ((force ~proc) synth sample_rate)))))

;; void fluid_synth_set_gain(fluid_synth_t *synth, float gain);
(define-public fluid_synth_set_gain
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_set_gain")
                       (list '* ffi:float)))))
    (lambda (synth gain)
      (let ((synth (cdata-arg->pointer synth)) (gain (cdata-arg->number gain)))
        ((force ~proc) synth gain)))))

;; float fluid_synth_get_gain(fluid_synth_t *synth);
(define-public fluid_synth_get_gain
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:float
                       (foreign-pointer-search "fluid_synth_get_gain")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_set_polyphony(fluid_synth_t *synth, int polyphony);
(define-public fluid_synth_set_polyphony
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_polyphony")
                       (list '* ffi:int)))))
    (lambda (synth polyphony)
      (let ((synth (cdata-arg->pointer synth))
            (polyphony (cdata-arg->number polyphony)))
        ((force ~proc) synth polyphony)))))

;; int fluid_synth_get_polyphony(fluid_synth_t *synth);
(define-public fluid_synth_get_polyphony
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_polyphony")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_get_active_voice_count(fluid_synth_t *synth);
(define-public fluid_synth_get_active_voice_count
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_active_voice_count")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_get_internal_bufsize(fluid_synth_t *synth);
(define-public fluid_synth_get_internal_bufsize
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_internal_bufsize")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_set_interp_method(fluid_synth_t *synth, int chan, int 
;;     interp_method);
(define-public fluid_synth_set_interp_method
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_interp_method")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan interp_method)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (interp_method (cdata-arg->number interp_method)))
        ((force ~proc) synth chan interp_method)))))

;; enum fluid_interp {
;;   FLUID_INTERP_NONE = 0,
;;   FLUID_INTERP_LINEAR = 1,
;;   FLUID_INTERP_4THORDER = 4,
;;   FLUID_INTERP_7THORDER = 7,
;;   FLUID_INTERP_DEFAULT = FLUID_INTERP_4THORDER,
;;   FLUID_INTERP_HIGHEST = FLUID_INTERP_7THORDER,
;; };
(define-public enum-fluid_interp
  (name-ctype
   'enum-fluid_interp
   (cenum '((FLUID_INTERP_NONE 0)
            (FLUID_INTERP_LINEAR 1)
            (FLUID_INTERP_4THORDER 4)
            (FLUID_INTERP_7THORDER 7)
            (FLUID_INTERP_DEFAULT 4)
            (FLUID_INTERP_HIGHEST 7)))))
(define-public unwrap-enum-fluid_interp
  (let ((numf (cenum-numf (ctype-info enum-fluid_interp))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_interp
  (let ((symf (cenum-symf (ctype-info enum-fluid_interp))))
    (lambda (arg) (or (symf arg) arg))))

;; enum fluid_synth_add_mod {
;;   FLUID_SYNTH_OVERWRITE,
;;   FLUID_SYNTH_ADD,
;; };
(define-public enum-fluid_synth_add_mod
  (name-ctype
   'enum-fluid_synth_add_mod
   (cenum '((FLUID_SYNTH_OVERWRITE 0) (FLUID_SYNTH_ADD 1)))))
(define-public unwrap-enum-fluid_synth_add_mod
  (let ((numf (cenum-numf (ctype-info enum-fluid_synth_add_mod))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_synth_add_mod
  (let ((symf (cenum-symf (ctype-info enum-fluid_synth_add_mod))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_add_default_mod(fluid_synth_t *synth, const fluid_mod_t *mod
;;     , int mode);
(define-public fluid_synth_add_default_mod
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_add_default_mod")
                       (list '* '* ffi:int)))))
    (lambda (synth mod mode)
      (let ((synth (cdata-arg->pointer synth))
            (mod (cdata-arg->pointer mod))
            (mode (cdata-arg->number mode)))
        ((force ~proc) synth mod mode)))))

;; int fluid_synth_remove_default_mod(fluid_synth_t *synth, const fluid_mod_t *
;;     mod);
(define-public fluid_synth_remove_default_mod
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_remove_default_mod")
                       (list '* '*)))))
    (lambda (synth mod)
      (let ((synth (cdata-arg->pointer synth)) (mod (cdata-arg->pointer mod)))
        ((force ~proc) synth mod)))))

;; int fluid_synth_activate_key_tuning(fluid_synth_t *synth, int bank, int prog
;;     , const char *name, const double *pitch, int apply);
(define-public fluid_synth_activate_key_tuning
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_activate_key_tuning")
                       (list '* ffi:int ffi:int '* '* ffi:int)))))
    (lambda (synth bank prog name pitch apply)
      (let ((synth (cdata-arg->pointer synth))
            (bank (cdata-arg->number bank))
            (prog (cdata-arg->number prog))
            (name (cdata-arg->pointer name))
            (pitch (cdata-arg->pointer pitch))
            (apply (cdata-arg->number apply)))
        ((force ~proc) synth bank prog name pitch apply)))))

;; int fluid_synth_activate_octave_tuning(fluid_synth_t *synth, int bank, int 
;;     prog, const char *name, const double *pitch, int apply);
(define-public fluid_synth_activate_octave_tuning
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_activate_octave_tuning")
                       (list '* ffi:int ffi:int '* '* ffi:int)))))
    (lambda (synth bank prog name pitch apply)
      (let ((synth (cdata-arg->pointer synth))
            (bank (cdata-arg->number bank))
            (prog (cdata-arg->number prog))
            (name (cdata-arg->pointer name))
            (pitch (cdata-arg->pointer pitch))
            (apply (cdata-arg->number apply)))
        ((force ~proc) synth bank prog name pitch apply)))))

;; int fluid_synth_tune_notes(fluid_synth_t *synth, int bank, int prog, int len
;;     , const int *keys, const double *pitch, int apply);
(define-public fluid_synth_tune_notes
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_tune_notes")
                       (list '* ffi:int ffi:int ffi:int '* '* ffi:int)))))
    (lambda (synth bank prog len keys pitch apply)
      (let ((synth (cdata-arg->pointer synth))
            (bank (cdata-arg->number bank))
            (prog (cdata-arg->number prog))
            (len (cdata-arg->number len))
            (keys (cdata-arg->pointer keys))
            (pitch (cdata-arg->pointer pitch))
            (apply (cdata-arg->number apply)))
        ((force ~proc) synth bank prog len keys pitch apply)))))

;; int fluid_synth_activate_tuning(fluid_synth_t *synth, int chan, int bank, 
;;     int prog, int apply);
(define-public fluid_synth_activate_tuning
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_activate_tuning")
                       (list '* ffi:int ffi:int ffi:int ffi:int)))))
    (lambda (synth chan bank prog apply)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (bank (cdata-arg->number bank))
            (prog (cdata-arg->number prog))
            (apply (cdata-arg->number apply)))
        ((force ~proc) synth chan bank prog apply)))))

;; int fluid_synth_deactivate_tuning(fluid_synth_t *synth, int chan, int apply)
;;     ;
(define-public fluid_synth_deactivate_tuning
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_deactivate_tuning")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan apply)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (apply (cdata-arg->number apply)))
        ((force ~proc) synth chan apply)))))

;; void fluid_synth_tuning_iteration_start(fluid_synth_t *synth);
(define-public fluid_synth_tuning_iteration_start
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search
                        "fluid_synth_tuning_iteration_start")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; int fluid_synth_tuning_iteration_next(fluid_synth_t *synth, int *bank, int *
;;     prog);
(define-public fluid_synth_tuning_iteration_next
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_tuning_iteration_next")
                       (list '* '* '*)))))
    (lambda (synth bank prog)
      (let ((synth (cdata-arg->pointer synth))
            (bank (cdata-arg->pointer bank))
            (prog (cdata-arg->pointer prog)))
        ((force ~proc) synth bank prog)))))

;; int fluid_synth_tuning_dump(fluid_synth_t *synth, int bank, int prog, char *
;;     name, int len, double *pitch);
(define-public fluid_synth_tuning_dump
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_tuning_dump")
                       (list '* ffi:int ffi:int '* ffi:int '*)))))
    (lambda (synth bank prog name len pitch)
      (let ((synth (cdata-arg->pointer synth))
            (bank (cdata-arg->number bank))
            (prog (cdata-arg->number prog))
            (name (cdata-arg->pointer name))
            (len (cdata-arg->number len))
            (pitch (cdata-arg->pointer pitch)))
        ((force ~proc) synth bank prog name len pitch)))))

;; int fluid_synth_write_s16(fluid_synth_t *synth, int len, void *lout, int 
;;     loff, int lincr, void *rout, int roff, int rincr);
(define-public fluid_synth_write_s16
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_write_s16")
                       (list '* ffi:int '* ffi:int ffi:int '* ffi:int ffi:int)))))
    (lambda (synth len lout loff lincr rout roff rincr)
      (let ((synth (cdata-arg->pointer synth))
            (len (cdata-arg->number len))
            (lout (cdata-arg->pointer lout))
            (loff (cdata-arg->number loff))
            (lincr (cdata-arg->number lincr))
            (rout (cdata-arg->pointer rout))
            (roff (cdata-arg->number roff))
            (rincr (cdata-arg->number rincr)))
        ((force ~proc) synth len lout loff lincr rout roff rincr)))))

;; int fluid_synth_write_float(fluid_synth_t *synth, int len, void *lout, int 
;;     loff, int lincr, void *rout, int roff, int rincr);
(define-public fluid_synth_write_float
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_write_float")
                       (list '* ffi:int '* ffi:int ffi:int '* ffi:int ffi:int)))))
    (lambda (synth len lout loff lincr rout roff rincr)
      (let ((synth (cdata-arg->pointer synth))
            (len (cdata-arg->number len))
            (lout (cdata-arg->pointer lout))
            (loff (cdata-arg->number loff))
            (lincr (cdata-arg->number lincr))
            (rout (cdata-arg->pointer rout))
            (roff (cdata-arg->number roff))
            (rincr (cdata-arg->number rincr)))
        ((force ~proc) synth len lout loff lincr rout roff rincr)))))

;; int fluid_synth_nwrite_float(fluid_synth_t *synth, int len, float **left, 
;;     float **right, float **fx_left, float **fx_right);
(define-public fluid_synth_nwrite_float
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_nwrite_float")
                       (list '* ffi:int '* '* '* '*)))))
    (lambda (synth len left right fx_left fx_right)
      (let ((synth (cdata-arg->pointer synth))
            (len (cdata-arg->number len))
            (left (cdata-arg->pointer left))
            (right (cdata-arg->pointer right))
            (fx_left (cdata-arg->pointer fx_left))
            (fx_right (cdata-arg->pointer fx_right)))
        ((force ~proc) synth len left right fx_left fx_right)))))

;; int fluid_synth_process(fluid_synth_t *synth, int len, int nfx, float *fx[]
;;     , int nout, float *out[]);
(define-public fluid_synth_process
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_process")
                       (list '*
                             ffi:int
                             ffi:int
                             (make-list #f '*)
                             ffi:int
                             (make-list #f '*))))))
    (lambda (synth len nfx fx nout out)
      (let ((synth (cdata-arg->pointer synth))
            (len (cdata-arg->number len))
            (nfx (cdata-arg->number nfx))
            (fx (cdata-arg->pointer fx))
            (nout (cdata-arg->number nout))
            (out (cdata-arg->pointer out)))
        ((force ~proc) synth len nfx fx nout out)))))

;; enum fluid_iir_filter_type {
;;   FLUID_IIR_DISABLED = 0,
;;   FLUID_IIR_LOWPASS,
;;   FLUID_IIR_HIGHPASS,
;;   FLUID_IIR_LAST,
;; };
(define-public enum-fluid_iir_filter_type
  (name-ctype
   'enum-fluid_iir_filter_type
   (cenum '((FLUID_IIR_DISABLED 0)
            (FLUID_IIR_LOWPASS 1)
            (FLUID_IIR_HIGHPASS 2)
            (FLUID_IIR_LAST 3)))))
(define-public unwrap-enum-fluid_iir_filter_type
  (let ((numf (cenum-numf (ctype-info enum-fluid_iir_filter_type))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_iir_filter_type
  (let ((symf (cenum-symf (ctype-info enum-fluid_iir_filter_type))))
    (lambda (arg) (or (symf arg) arg))))

;; enum fluid_iir_filter_flags {
;;   FLUID_IIR_Q_LINEAR = 1<<0,
;;   FLUID_IIR_Q_ZERO_OFF = 1<<1,
;;   FLUID_IIR_NO_GAIN_AMP = 1<<2,
;; };
(define-public enum-fluid_iir_filter_flags
  (name-ctype
   'enum-fluid_iir_filter_flags
   (cenum '((FLUID_IIR_Q_LINEAR 1)
            (FLUID_IIR_Q_ZERO_OFF 2)
            (FLUID_IIR_NO_GAIN_AMP 4)))))
(define-public unwrap-enum-fluid_iir_filter_flags
  (let ((numf (cenum-numf (ctype-info enum-fluid_iir_filter_flags))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_iir_filter_flags
  (let ((symf (cenum-symf (ctype-info enum-fluid_iir_filter_flags))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_set_custom_filter(fluid_synth_t *, int type, int flags);
(define-public fluid_synth_set_custom_filter
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_custom_filter")
                       (list '* ffi:int ffi:int)))))
    (lambda (arg0 type flags)
      (let ((arg0 (cdata-arg->pointer arg0))
            (type (cdata-arg->number type))
            (flags (cdata-arg->number flags)))
        ((force ~proc) arg0 type flags)))))

;; enum fluid_midi_channel_type {
;;   CHANNEL_TYPE_MELODIC = 0,
;;   CHANNEL_TYPE_DRUM = 1,
;; };
(define-public enum-fluid_midi_channel_type
  (name-ctype
   'enum-fluid_midi_channel_type
   (cenum '((CHANNEL_TYPE_MELODIC 0) (CHANNEL_TYPE_DRUM 1)))))
(define-public unwrap-enum-fluid_midi_channel_type
  (let ((numf (cenum-numf (ctype-info enum-fluid_midi_channel_type))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_midi_channel_type
  (let ((symf (cenum-symf (ctype-info enum-fluid_midi_channel_type))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_set_channel_type(fluid_synth_t *synth, int chan, int type);
(define-public fluid_synth_set_channel_type
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_channel_type")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan type)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (type (cdata-arg->number type)))
        ((force ~proc) synth chan type)))))

;; enum fluid_channel_mode_flags {
;;   FLUID_CHANNEL_POLY_OFF = 0x01,
;;   FLUID_CHANNEL_OMNI_OFF = 0x02,
;; };
(define-public enum-fluid_channel_mode_flags
  (name-ctype
   'enum-fluid_channel_mode_flags
   (cenum '((FLUID_CHANNEL_POLY_OFF 1) (FLUID_CHANNEL_OMNI_OFF 2)))))
(define-public unwrap-enum-fluid_channel_mode_flags
  (let ((numf (cenum-numf (ctype-info enum-fluid_channel_mode_flags))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_channel_mode_flags
  (let ((symf (cenum-symf (ctype-info enum-fluid_channel_mode_flags))))
    (lambda (arg) (or (symf arg) arg))))

;; enum fluid_basic_channel_modes {
;;   FLUID_CHANNEL_MODE_MASK = FLUID_CHANNEL_OMNI_OFF | FLUID_CHANNEL_POLY_OFF,
;;       
;;   FLUID_CHANNEL_MODE_OMNION_POLY = FLUID_CHANNEL_MODE_MASK & (~
;;       FLUID_CHANNEL_OMNI_OFF & ~FLUID_CHANNEL_POLY_OFF),
;;   FLUID_CHANNEL_MODE_OMNION_MONO = FLUID_CHANNEL_MODE_MASK & (~
;;       FLUID_CHANNEL_OMNI_OFF & FLUID_CHANNEL_POLY_OFF),
;;   FLUID_CHANNEL_MODE_OMNIOFF_POLY = FLUID_CHANNEL_MODE_MASK & (
;;       FLUID_CHANNEL_OMNI_OFF & ~FLUID_CHANNEL_POLY_OFF),
;;   FLUID_CHANNEL_MODE_OMNIOFF_MONO = FLUID_CHANNEL_MODE_MASK & (
;;       FLUID_CHANNEL_OMNI_OFF | FLUID_CHANNEL_POLY_OFF),
;;   FLUID_CHANNEL_MODE_LAST,
;; };
(define-public enum-fluid_basic_channel_modes
  (name-ctype
   'enum-fluid_basic_channel_modes
   (cenum '((FLUID_CHANNEL_MODE_MASK 3)
            (FLUID_CHANNEL_MODE_OMNION_POLY 0)
            (FLUID_CHANNEL_MODE_OMNION_MONO 1)
            (FLUID_CHANNEL_MODE_OMNIOFF_POLY 2)
            (FLUID_CHANNEL_MODE_OMNIOFF_MONO 3)
            (FLUID_CHANNEL_MODE_LAST 4)))))
(define-public unwrap-enum-fluid_basic_channel_modes
  (let ((numf (cenum-numf (ctype-info enum-fluid_basic_channel_modes))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_basic_channel_modes
  (let ((symf (cenum-symf (ctype-info enum-fluid_basic_channel_modes))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_reset_basic_channel(fluid_synth_t *synth, int chan);
(define-public fluid_synth_reset_basic_channel
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_reset_basic_channel")
                       (list '* ffi:int)))))
    (lambda (synth chan)
      (let ((synth (cdata-arg->pointer synth)) (chan (cdata-arg->number chan)))
        ((force ~proc) synth chan)))))

;; int fluid_synth_get_basic_channel(fluid_synth_t *synth, int chan, int *
;;     basic_chan_out, int *mode_chan_out, int *basic_val_out);
(define-public fluid_synth_get_basic_channel
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_basic_channel")
                       (list '* ffi:int '* '* '*)))))
    (lambda (synth chan basic_chan_out mode_chan_out basic_val_out)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (basic_chan_out (cdata-arg->pointer basic_chan_out))
            (mode_chan_out (cdata-arg->pointer mode_chan_out))
            (basic_val_out (cdata-arg->pointer basic_val_out)))
        ((force ~proc) synth chan basic_chan_out mode_chan_out basic_val_out)))))

;; int fluid_synth_set_basic_channel(fluid_synth_t *synth, int chan, int mode, 
;;     int val);
(define-public fluid_synth_set_basic_channel
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_basic_channel")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth chan mode val)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (mode (cdata-arg->number mode))
            (val (cdata-arg->number val)))
        ((force ~proc) synth chan mode val)))))

;; enum fluid_channel_legato_mode {
;;   FLUID_CHANNEL_LEGATO_MODE_RETRIGGER,
;;   FLUID_CHANNEL_LEGATO_MODE_MULTI_RETRIGGER,
;;   FLUID_CHANNEL_LEGATO_MODE_LAST,
;; };
(define-public enum-fluid_channel_legato_mode
  (name-ctype
   'enum-fluid_channel_legato_mode
   (cenum '((FLUID_CHANNEL_LEGATO_MODE_RETRIGGER 0)
            (FLUID_CHANNEL_LEGATO_MODE_MULTI_RETRIGGER 1)
            (FLUID_CHANNEL_LEGATO_MODE_LAST 2)))))
(define-public unwrap-enum-fluid_channel_legato_mode
  (let ((numf (cenum-numf (ctype-info enum-fluid_channel_legato_mode))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_channel_legato_mode
  (let ((symf (cenum-symf (ctype-info enum-fluid_channel_legato_mode))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_set_legato_mode(fluid_synth_t *synth, int chan, int 
;;     legatomode);
(define-public fluid_synth_set_legato_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_legato_mode")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan legatomode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (legatomode (cdata-arg->number legatomode)))
        ((force ~proc) synth chan legatomode)))))

;; int fluid_synth_get_legato_mode(fluid_synth_t *synth, int chan, int *
;;     legatomode);
(define-public fluid_synth_get_legato_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_legato_mode")
                       (list '* ffi:int '*)))))
    (lambda (synth chan legatomode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (legatomode (cdata-arg->pointer legatomode)))
        ((force ~proc) synth chan legatomode)))))

;; enum fluid_channel_portamento_mode {
;;   FLUID_CHANNEL_PORTAMENTO_MODE_EACH_NOTE,
;;   FLUID_CHANNEL_PORTAMENTO_MODE_LEGATO_ONLY,
;;   FLUID_CHANNEL_PORTAMENTO_MODE_STACCATO_ONLY,
;;   FLUID_CHANNEL_PORTAMENTO_MODE_LAST,
;; };
(define-public enum-fluid_channel_portamento_mode
  (name-ctype
   'enum-fluid_channel_portamento_mode
   (cenum '((FLUID_CHANNEL_PORTAMENTO_MODE_EACH_NOTE 0)
            (FLUID_CHANNEL_PORTAMENTO_MODE_LEGATO_ONLY 1)
            (FLUID_CHANNEL_PORTAMENTO_MODE_STACCATO_ONLY 2)
            (FLUID_CHANNEL_PORTAMENTO_MODE_LAST 3)))))
(define-public unwrap-enum-fluid_channel_portamento_mode
  (let ((numf (cenum-numf (ctype-info enum-fluid_channel_portamento_mode))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_channel_portamento_mode
  (let ((symf (cenum-symf (ctype-info enum-fluid_channel_portamento_mode))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_set_portamento_mode(fluid_synth_t *synth, int chan, int 
;;     portamentomode);
(define-public fluid_synth_set_portamento_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_set_portamento_mode")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan portamentomode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (portamentomode (cdata-arg->number portamentomode)))
        ((force ~proc) synth chan portamentomode)))))

;; int fluid_synth_get_portamento_mode(fluid_synth_t *synth, int chan, int *
;;     portamentomode);
(define-public fluid_synth_get_portamento_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search
                        "fluid_synth_get_portamento_mode")
                       (list '* ffi:int '*)))))
    (lambda (synth chan portamentomode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (portamentomode (cdata-arg->pointer portamentomode)))
        ((force ~proc) synth chan portamentomode)))))

;; enum fluid_channel_breath_flags {
;;   FLUID_CHANNEL_BREATH_POLY = 0x10,
;;   FLUID_CHANNEL_BREATH_MONO = 0x20,
;;   FLUID_CHANNEL_BREATH_SYNC = 0x40,
;; };
(define-public enum-fluid_channel_breath_flags
  (name-ctype
   'enum-fluid_channel_breath_flags
   (cenum '((FLUID_CHANNEL_BREATH_POLY 16)
            (FLUID_CHANNEL_BREATH_MONO 32)
            (FLUID_CHANNEL_BREATH_SYNC 64)))))
(define-public unwrap-enum-fluid_channel_breath_flags
  (let ((numf (cenum-numf (ctype-info enum-fluid_channel_breath_flags))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-enum-fluid_channel_breath_flags
  (let ((symf (cenum-symf (ctype-info enum-fluid_channel_breath_flags))))
    (lambda (arg) (or (symf arg) arg))))

;; int fluid_synth_set_breath_mode(fluid_synth_t *synth, int chan, int 
;;     breathmode);
(define-public fluid_synth_set_breath_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_set_breath_mode")
                       (list '* ffi:int ffi:int)))))
    (lambda (synth chan breathmode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (breathmode (cdata-arg->number breathmode)))
        ((force ~proc) synth chan breathmode)))))

;; int fluid_synth_get_breath_mode(fluid_synth_t *synth, int chan, int *
;;     breathmode);
(define-public fluid_synth_get_breath_mode
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_get_breath_mode")
                       (list '* ffi:int '*)))))
    (lambda (synth chan breathmode)
      (let ((synth (cdata-arg->pointer synth))
            (chan (cdata-arg->number chan))
            (breathmode (cdata-arg->pointer breathmode)))
        ((force ~proc) synth chan breathmode)))))

;; fluid_settings_t *fluid_synth_get_settings(fluid_synth_t *synth);
(define-public fluid_synth_get_settings
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_get_settings")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; void fluid_synth_add_sfloader(fluid_synth_t *synth, fluid_sfloader_t *loader
;;     );
(define-public fluid_synth_add_sfloader
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:void
                       (foreign-pointer-search "fluid_synth_add_sfloader")
                       (list '* '*)))))
    (lambda (synth loader)
      (let ((synth (cdata-arg->pointer synth))
            (loader (cdata-arg->pointer loader)))
        ((force ~proc) synth loader)))))

;; fluid_preset_t *fluid_synth_get_channel_preset(fluid_synth_t *synth, int 
;;     chan);
(define-public fluid_synth_get_channel_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search
                        "fluid_synth_get_channel_preset")
                       (list '* ffi:int)))))
    (lambda (synth chan)
      (let ((synth (cdata-arg->pointer synth)) (chan (cdata-arg->number chan)))
        ((force ~proc) synth chan)))))

;; int fluid_synth_handle_midi_event(void *data, fluid_midi_event_t *event);
(define-public fluid_synth_handle_midi_event
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_handle_midi_event")
                       (list '* '*)))))
    (lambda (data event)
      (let ((data (cdata-arg->pointer data))
            (event (cdata-arg->pointer event)))
        ((force ~proc) data event)))))

;; int fluid_synth_pin_preset(fluid_synth_t *synth, int sfont_id, int bank_num
;;     , int preset_num);
(define-public fluid_synth_pin_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_pin_preset")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth sfont_id bank_num preset_num)
      (let ((synth (cdata-arg->pointer synth))
            (sfont_id (cdata-arg->number sfont_id))
            (bank_num (cdata-arg->number bank_num))
            (preset_num (cdata-arg->number preset_num)))
        ((force ~proc) synth sfont_id bank_num preset_num)))))

;; int fluid_synth_unpin_preset(fluid_synth_t *synth, int sfont_id, int 
;;     bank_num, int preset_num);
(define-public fluid_synth_unpin_preset
  (let ((~proc (delay (ffi:pointer->procedure
                       ffi:int
                       (foreign-pointer-search "fluid_synth_unpin_preset")
                       (list '* ffi:int ffi:int ffi:int)))))
    (lambda (synth sfont_id bank_num preset_num)
      (let ((synth (cdata-arg->pointer synth))
            (sfont_id (cdata-arg->number sfont_id))
            (bank_num (cdata-arg->number bank_num))
            (preset_num (cdata-arg->number preset_num)))
        ((force ~proc) synth sfont_id bank_num preset_num)))))

;; fluid_ladspa_fx_t *fluid_synth_get_ladspa_fx(fluid_synth_t *synth);
(define-public fluid_synth_get_ladspa_fx
  (let ((~proc (delay (ffi:pointer->procedure
                       '*
                       (foreign-pointer-search "fluid_synth_get_ladspa_fx")
                       (list '*)))))
    (lambda (synth)
      (let ((synth (cdata-arg->pointer synth))) ((force ~proc) synth)))))

;; access to enum symbols and #define'd constants:
(define f-synth-ffi-synth-symbol-tab
  '((FLUID_CHANNEL_BREATH_SYNC . 64)
    (FLUID_CHANNEL_BREATH_MONO . 32)
    (FLUID_CHANNEL_BREATH_POLY . 16)
    (FLUID_CHANNEL_PORTAMENTO_MODE_LAST . 3)
    (FLUID_CHANNEL_PORTAMENTO_MODE_STACCATO_ONLY . 2)
    (FLUID_CHANNEL_PORTAMENTO_MODE_LEGATO_ONLY . 1)
    (FLUID_CHANNEL_PORTAMENTO_MODE_EACH_NOTE . 0)
    (FLUID_CHANNEL_LEGATO_MODE_LAST . 2)
    (FLUID_CHANNEL_LEGATO_MODE_MULTI_RETRIGGER . 1)
    (FLUID_CHANNEL_LEGATO_MODE_RETRIGGER . 0)
    (FLUID_CHANNEL_MODE_LAST . 4)
    (FLUID_CHANNEL_MODE_OMNIOFF_MONO . 3)
    (FLUID_CHANNEL_MODE_OMNIOFF_POLY . 2)
    (FLUID_CHANNEL_MODE_OMNION_MONO . 1)
    (FLUID_CHANNEL_MODE_OMNION_POLY . 0)
    (FLUID_CHANNEL_MODE_MASK . 3)
    (FLUID_CHANNEL_OMNI_OFF . 2)
    (FLUID_CHANNEL_POLY_OFF . 1)
    (CHANNEL_TYPE_DRUM . 1)
    (CHANNEL_TYPE_MELODIC . 0)
    (FLUID_IIR_NO_GAIN_AMP . 4)
    (FLUID_IIR_Q_ZERO_OFF . 2)
    (FLUID_IIR_Q_LINEAR . 1)
    (FLUID_IIR_LAST . 3)
    (FLUID_IIR_HIGHPASS . 2)
    (FLUID_IIR_LOWPASS . 1)
    (FLUID_IIR_DISABLED . 0)
    (FLUID_SYNTH_ADD . 1)
    (FLUID_SYNTH_OVERWRITE . 0)
    (FLUID_INTERP_HIGHEST . 7)
    (FLUID_INTERP_DEFAULT . 4)
    (FLUID_INTERP_7THORDER . 7)
    (FLUID_INTERP_4THORDER . 4)
    (FLUID_INTERP_LINEAR . 1)
    (FLUID_INTERP_NONE . 0)
    (FLUID_CHORUS_MOD_TRIANGLE . 1)
    (FLUID_CHORUS_MOD_SINE . 0)
    (BUILD_SHARED_LIBS . 1)))
(export f-synth-ffi-synth-symbol-tab)

(define f-synth-ffi-synth-symbol-val
  (lambda (k) (or (assq-ref f-synth-ffi-synth-symbol-tab k))))
(export f-synth-ffi-synth-symbol-val)

(define (unwrap~enum arg)
  (cond
    ((number? arg) arg)
    ((symbol? arg) (f-synth-ffi-synth-symbol-val arg))
    ((cdata? arg) (cdata-ref arg))
    (else (error "type mismatch"))))

(define f-synth-ffi-synth-types
  '((enum . "fluid_chorus_mod") (enum . "fluid_interp") (enum . 
    "fluid_synth_add_mod") (enum . "fluid_iir_filter_type") (enum . 
    "fluid_iir_filter_flags") (enum . "fluid_midi_channel_type") (enum . 
    "fluid_channel_mode_flags") (enum . "fluid_basic_channel_modes") (enum . 
    "fluid_channel_legato_mode") (enum . "fluid_channel_portamento_mode") 
    (enum . "fluid_channel_breath_flags")))
(export f-synth-ffi-synth-types)

;; --- last line ---
