;;####################
;; 清除未使用的插件
;;####################
(package-autoremove)

;;####################
;; 添加快捷键
;;####################
(eippay-write-keybind)
(require 'init-keybinds)


;; 设置 Emacs 自动添加的插件配置到 ~/.emacs.d/lisp/custom.el
;; 谨慎更改本段
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(provide 'end)
