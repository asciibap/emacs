(defun config ()
  "General configurations"
  
  (linum-mode 1)                 ;; Line numbers
  (show-paren-mode 1)            ;; Show matching pairs
  (electric-pair-mode 1)         ;; Auto insert pairs
  (setq column-number-mode t)    ;; Column numbers
  
  (setq-default c-basic-offset 4 ;; Tabs config
                tab-width 4
                indent-tabs-mode t))
  
(defun gui ()
  "GUI only configurations"
  
  (load-theme 'misterioso t)                    ;; Color theme
  (set-face-attribute 'default nil :height 110) ;; Font size
  (tool-bar-mode -1))                           ;; Disable toolbar

(defun get-plugged ()
  "Plugins configuration"
  
  ;; Evil mode
  (add-to-list 'load-path "~/.emacs.d/plugged/evil")
  (setq evil-want-C-u-scroll t)
  (require 'evil)
  (evil-mode 1)
  
  ;; Keychord
  (add-to-list 'load-path "~/.emacs.d/plugged/key-chord")
  (require 'key-chord)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))


;; UTF-8 please
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Deal with backups. Don't
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Mac Keyboard config
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Recent emacs only!
(when (> emacs-major-version 23)
  (get-plugged)
  (gui)
  (config))
