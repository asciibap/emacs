(defun melpa-packages ()
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  
  (setq package-list '(evil key-chord slime))

  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))


(defun evil-and-keychord-on ()
  (setq evil-want-C-u-scroll t)
  (require 'evil)
  (evil-mode 1)

  (require 'key-chord)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))


(defun slime-on ()
  (setq inferior-lisp-program "/usr/local/bin/clisp")
  (setq slime-contribs '(slime-fancy)))
