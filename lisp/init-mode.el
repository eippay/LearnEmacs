;;####################
;; org-mode 配置
;;####################
(require 'org)
;; 在编辑文本文件时，同样支持语法高亮
(setq org-src-fontify-natively t)
;; org议程管理
;; org议程文件存在到 ~/org 目录中
(setq org-agenda-files '("~/org"))
;; 查看议程
(global-set-key (kbd "C-c a") 'org-agenda)


;;####################
;; js2-mode
;; nodejs-repl
;;####################
;; javascript IDE
(eippay-package-install 'js2-mode)
(eippay-package-install 'nodejs-repl)
;; 使用 js2-mode 打开 .js 文件
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(require 'nodejs-repl)

(provide 'init-mode)

