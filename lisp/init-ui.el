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
;; 关闭侧边滚动条
(scroll-bar-mode 0)
;; 关闭菜单栏
(menu-bar-mode 0)
;; 关闭 electric-indent 缩进模式
;; (electric-indent-mode -1)
;; 显示行号
(global-linum-mode t)
;; 启动Emacs后，自动全屏显示
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 关闭启动画面
(setq inhibit-splash-screen t)
;; 打开Emacs时，自动打开双窗格
;; (split-window-right)
;; (split-window-below)
;; 关闭 *scratch* 缓冲区的提示
(setq initial-scratch-message nil)
;;----------
;; 光标设置
;;----------
;; 修改光标样式
(setq-default cursor-type 'bar)
;; 禁止光标闪烁
(blink-cursor-mode 0)
;; 不同模式下，光标颜色不同
;;(setq evil-emacs-state-cursor '("red" box))
;;(setq evil-normal-state-cursor '("green" box))
;;(setq evil-visual-state-cursor '("orange" box))
;;(setq evil-insert-state-cursor '("red" bar))
;;(setq evil-replace-state-cursor '("red" bar))
;;(setq evil-operator-state-cursor '("red" hollow))

;; 高亮当前行
(global-hl-line-mode t)


;; 美化状态栏
(eippay-package-install 'powerline-evil)
(require 'powerline-evil)
(powerline-evil-center-color-theme)
;;(powerline-evil-vim-theme)
;;(powerline-evil-vim-color-theme)
;; 显示窗格编号
;; 必须在 (powerline-default-theme) 之后设置才会生效
(eippay-package-install 'window-numbering)
(window-numbering-mode 1)


(provide 'init-ui)
