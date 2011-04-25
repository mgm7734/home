;;; misc general
(global-set-key "" (quote newline-and-indent))

;;;; (setq site-lisp-path "c:/opt/emacs-22.3/site-lisp/")

;;; line & column numbers
(line-number-mode 1)
(column-number-mode 1)

;;; erlang
(when (file-directory-p "/NOT-THERE")
    (setq load-path (cons  "C:/Program Files/erl5.6.5/lib/tools-2.6.2/emacs"
			   load-path))
    (setq erlang-root-dir "C:/Program Files/erl5.6.5")
    (setq exec-path (cons "C:/Program Files/erl5.6.5/bin" exec-path))
    (require 'erlang-start)
)

;;; ruby
;;(setq load-path (cons "c:/opt/ruby/doc/ruby/ruby-1.8.6/misc" load-path))
(require 'ruby-mode)
(setq auto-mode-alist (cons (cons "\\.rb\\'" 'ruby-mode) auto-mode-alist))

;;; scala
(add-to-list 'load-path
 	     "/Users/mgm7734/opt/scala/misc/scala-tool-support/emacs")
(add-to-list 'auto-mode-alist
             (cons "\\.scala" 'scala-mode))
(require 'scala-mode-auto)

;;; tramp
;;(require 'tramp)
;;(setq tramp-default-method "plink")

;;; uniquify
(require 'uniquify)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(indent-tabs-mode nil)
 '(scala-interpreter "/Users/mgm7734/opt/scala/bin/scala")
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
