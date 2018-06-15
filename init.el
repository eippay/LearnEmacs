;; 添加lisp到环境路径中，以便require查找lisp中的文件
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; 初始化源，同时载入辅助配置函数
(require 'start)
;; 配置交互习惯
(require 'interactive-custom)
;; 主题界面设置
(require 'init-ui)
;; 模式相关设置
(require 'init-mode)
;; 编程习惯配置
(require 'edit-code)
;; 快捷键设置，同时清理不使用的插件
(require 'end)

(put 'dired-find-alternate-file 'disabled nil)
