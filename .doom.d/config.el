;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Toni Tuominen"
      user-mail-address "toni@tuominen.co")

;; =============================================================
;; Doom config
;; =============================================================

(setq doom-font (font-spec :family "JetBrains Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 13))
(setq doom-theme 'doom-one)
(setq display-line-numbers-type 'relative)
(setq doom-localleader-key ",")

(setq find-file-visit-truename t) ;; Resolve symlinks

(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode             ; elisp's mechanisms are good enough
            sql-mode                    ; sqlformat is currently broken
            tex-mode                    ; latexindent is broken
            latex-mode
            web-mode))

;; =============================================================
;; Package configs
;; =============================================================

(use-package! aggressive-indent
  :hook ((clojure-mode . aggressive-indent-mode)
         (lips-mode . aggressive-indent-mode)
         (emacs-lisp-mode . aggressive-indent-mode)))

(use-package! clojure-mode
  :config
  (define-clojure-indent
    (div 1)
    (sui/ui-table 1))
  :custom
  (clojure-toplevel-inside-comment-form t)
  (clojure-align-forms-automatically t))

(use-package! cider
  :after clojure-mode
  :config
  (set-lookup-handlers! 'cider-mode nil))

(use-package! clj-refactor
  :after clojure-mode
  :config
  (set-lookup-handlers! 'clj-refactor-mode nil)
  :custom
  (cljr--add-ns-if-blank-clj-file nil))


(use-package! emmet-mode
  :bind
  ("s-e" . emmet-expand-line))

(use-package! evil-snipe
  :custom
  (setq evil-snipe-override-evil-repeat-keys nil))

(use-package! org
  :init
  (setq org-directory "~/Notes/org")
  :custom
  (org-attach-id-dir ".attachments"))

(use-package! org-roam
  :config
  (setq org-roam-directory "~/Notes/roam")
  (setq org-roam-dailies-directory "daily/"))

(use-package! smartparens
  :init (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  :hook ((clojure-mode . smartparens-strict-mode)
         (lisp-mode . smartparens-strict-mode)
         (emacs-lisp-mode . smartparens-strict-mode)))

;; =============================================================
;; Paredit key bindings
;; =============================================================

(map! (:prefix ("s-p" . "paredit")
       "p" #'paredit-wrap-round
       "[" #'paredit-wrap-square
       "{" #'paredit-wrap-curly

       "." #'paredit-forward-slurp-sexp
       "," #'paredit-backward-slurp-sexp
       ">" #'paredit-forward-barf-sexp
       "<" #'paredit-backward-barf-sexp

       "o" #'paredit-splice-sexp
       "j" #'paredit-join-sexps
       "k" #'paredit-split-sexp))

;; =============================================================
;; Fulcro functions
;; =============================================================

(defun restart-fulcro-system ()
  (interactive)
  (save-buffer)
  (let ((filename
         (buffer-file-name)))
    (when filename
      (cider-interactive-eval
       "(in-ns 'development)
        (restart)"))))

(map! "s-r" #'restart-fulcro-system)
