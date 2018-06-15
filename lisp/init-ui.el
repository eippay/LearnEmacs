;;####################
;; 使用 monokai-theme 主题
;;####################
(eippay-package-install 'monokai-theme)
;; 加载主题
(load-theme 'monokai t)

;; 关闭声音提示
(setq ring-bell-function 'ignore)
;; 关闭工具栏
(tool-bar-mode 0)
;; 关闭侧栏
(scroll-bar-mode 0)
;; 关闭 electric-indent 缩进模式
;; (electric-indent-mode -1)
;; 显示行号
(global-linum-mode t)
;; 启动Emacs后，自动全屏显示
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 关闭启动画面
;; (setq inhibit-splash-screen t)
;; 关闭 *scratch* 缓冲区的提示
;; (setq initial-scratch-message nil)
;;----------
;; 光标设置
;;----------
;; 修改光标样式
;; (setq-default cursor-type 'bar)
;; 禁止光标闪烁
(blink-cursor-mode 0)
;; 不同模式下，光标颜色不同
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))


;; 显示最近打开的文件
;;(require 'recentf)
;;(recentf-mode 1)
;;(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 禁止生成备份文件
(setq make-backup-files nil)

;; 高亮匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 输入时删除选中的文本
;; (delete-selection-mode t)

;; 高亮当前行
(global-hl-line-mode t)


;; 在 [File] => [File Recent] 里保存最近打开文件
;; (recentf-mode t)


(provide 'init-ui)
