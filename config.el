;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load personalized bindings


(use-package! ess-r-mode)

(use-package! ess-smart-underscore)
(setq ess-S-underscore-when-last-character-is-a-space t)
;; add to smarter underscore to inferior mode
(add-hook! 'inferior-ess-mode-hook ess-smart-underscore-add-inf)

;;(use-package! fill-column-indicator)
(add-hook! 'ess-mode-hook fci-mode)
;;(add-hook! 'ess-mode-hook column-enforce-mode)

(setq comint-scroll-to-bottom-on-output t)
(setq comint-scroll-to-bottom-on-input t)

(add-hook! 'inferior-ess-mode-hook buffer-disable-undo)

(setq fill-column 80)

(setq ess-ask-for-ess-directory nil)

(windmove-default-keybindings)
(setq windmove-wrap-around t)
(global-set-key (kbd "M-o") 'ace-window)

;; Resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; map ^^ to %>% in ess-mode for magrittr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pipe-function () (interactive) (if (not (eq last-command 'pipe-function)) (insert "^") (setq this-command nil) (delete-backward-char 1) (call-interactively 'add-magrittr-pipe)))

(defun add-magrittr-pipe () (interactive) (insert " %>% "))

(define-key ess-mode-map [(^)] 'pipe-function)
;; for interactive
(define-key inferior-ess-mode-map [(^)] 'pipe-function)

(add-hook! 'inferior-ess-mode-hook
           '(lambda()
              (local-set-key [("^")] 'pipe-function)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; map ** to %*% in ess-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun star-function () (interactive) (if (not (eq last-command 'star-function)) (insert "*") (setq this-command nil) (delete-backward-char 1) (call-interactively 'add-matrix-multiply)))

(defun add-matrix-multiply () (interactive) (insert " %*% "))


(define-key ess-mode-map [(*)] 'star-function)
;; for interactive R
(define-key inferior-ess-mode-map [(*)] 'star-function)

(add-hook! 'inferior-ess-mode-hook
           '(lambda()
             (local-set-key [("*")] 'star-function)))


;; Autocomplete
(use-package! auto-complete)
(ac-config-default)
;;(setq ac-quick-help-delay 0.1)

;; Polymode for Rmarkdown
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; Rstudio style in ESS
(ess-set-style 'RStudio)
(setq ess-offset-arguments 'prev-line)

;; C-c C-j stpes in ess
(add-hook 'ess-mode-hook
          '(lambda()
          (define-key ess-mode-map (kbd "C-c C-j") 'ess-eval-line-and-step)))

(load! "+bindings")

