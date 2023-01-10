;; Inicialização do Emacs

(setq inhibit-startup-message t
      initial-scratch-message "Hi, Emacs!"
      cursor-type 'bar
      )

;; Gerenciando o coletor de lixo

;; O padrão é 800 kb. Medido em bytes 
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Compilação Nativa

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)

;; Define o arquivo de inicialização do emacs
(setq custom-file ( expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


