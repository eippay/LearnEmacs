;;####################
;; 添加快捷键
;;####################
;; 生成 init-keybinds.el 文件
(eippay-write-keybind)
;; 执行 init-keybinds 文件
(require 'init-keybinds)


;;####################
;; 清除未使用的插件
;;####################
(package-autoremove)


;; 设置 Emacs 自动添加的插件配置到 ~/.emacs.d/lisp/custom.el
;; 谨慎更改本段
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)


(provide 'init-end)
