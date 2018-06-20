
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

(provide 'init-code)
