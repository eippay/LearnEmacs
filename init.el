;; 添加lisp到环境路径中，以便require查找lisp中的文件
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; 初始化源，同时载入辅助配置函数
(require 'init-start)
;; 主题界面设置
(require 'init-ui)
;; 模式相关设置
(require 'init-mode)
;; 配置交互习惯
(require 'init-interactive)
;; 查找
(require 'init-findfile)
;; 编辑习惯
(require 'init-edit)
;; 选区配置
(require 'init-visual)
;; 待分类配置
(require 'init-else)
;; 快捷键设置，同时清理不使用的插件
(require 'init-end)

(put 'dired-find-alternate-file 'disabled nil)
