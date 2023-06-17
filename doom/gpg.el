;; See
;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
;; https://github.com/QubesOS/qubes-issues/issues/2057
;;
;; Config: https://github.com/admiralakber/myOS-emacs/blob/master/config/config.el
;;(setq epg-debug t)
(when (string= (getenv "QUBES_ENV_SOURCED") "1")
    (custom-set-variables
     '(epg-gpg-program "/usr/bin/qubes-gpg-client-wrapper"))
  ;;(setenv "QUBES_GPG_DOMAIN" "gpg")
  ;; (push (cons 'OpenPGP (epg-config--make-gpg-configuration epg-gpg-program))
  ;;       epg--configurations)
  ;;(setq package-gnupghome-dir nil)
  ;;(setq auto-save-default nil)   ;; Auto saving of decrypted files is a security flaw, never risk
  )
