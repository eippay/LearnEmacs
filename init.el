(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)

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

;; org-mode 配置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 显示最近打开的文件
;;(require 'recentf)
;;(recentf-mode 1)
;;(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 禁止生成备份文件
(setq make-backup-files nil)
;; 文本中语法高亮
(require 'org)
(setq org-src-fontify-natively t)
;; 高亮匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 输入时删除选中的文本
;; (delete-selection-mode t)

;; 高亮当前行
(global-hl-line-mode t)

;; 函数用于打开 init.el 文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; <F2> 配置 init.el 文件
(global-set-key (kbd "<f2>") 'open-my-init-file)
;; 在 [File] => [File Recent] 里保存最近打开文件
;; (recentf-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))



