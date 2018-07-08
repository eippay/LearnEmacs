
;; common lisp配置
;;##################################################
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup '(slime-fancy))



;; JavaScript配置
;;##################################################
(eippay-package-install 'flycheck)

;; 使 flycheck 在 js2-mode 下生效
(add-hook 'js2-mode-hook 'flycheck-mode)



;; sawfish配置
;;##################################################
;; sawfish mode settings
;; load the first sawfish.el or sawfish.elc file found in the load-path
(load "sawfish")
;; this tells emacs to automatically activate the sawfish-mode whenever open
;; file with "sawfishrc" or "jl" (John Lisp) suffix
(add-to-list 'auto-mode-alist '(".*sawfishrc\\'" . sawfish-mode ))
(add-to-list 'auto-mode-alist '(".*\\.jl\\'" . sawfish-mode ))
;; if you're using ECB, tells to use the compilation buffer to show long
;; sawfish messages  
;;(add-to-list 'ecb-compilation-buffer-names '("*sawfish*"))
(add-hook 'sawfish-mode-hook
           (lambda ()
             (sawfish-eval '(require 'sawfish.my.module))))

(provide 'init-code)
