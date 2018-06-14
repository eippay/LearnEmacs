(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-mode)
(require 'init-keybinds)


;; 设置 Emacs 自动添加的插件配置到 ~/.emacs.d/lisp/custom.el 
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
