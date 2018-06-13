
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;;####################
;; zilongshanren源
;;####################
;; 添加melpa源
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; 导入 common lisp 库

(require 'cl)

;;(defvar zilongshanren/packages nil)
(setf *install-packages* '(
				 company
				 monokai-theme
				 hungry-delete
;;				 smex
				 swiper
				 counsel
				 smartparens
				 js2-mode
				 nodejs-repl
					 ))
(setq package-selected-packages *install-packages*)
(let ((installing-packages-list (remove-if #'(lambda (pkg) (package-installed-p pkg)) *install-packages*)))
  (when installing-packages-list
    (message "%s" "Refreshing package database...")
   (package-refresh-contents)
    (dolist (pkg installing-packages-list)
      (package-install pkg))))

;;(defun zilongshanren/packages-installed-p ()
  ;(loop for pkg in zilongshanren/packages
;;	when (not (package-installed-p pkg)) do (return nil)
;;	finally (return t)))

;;(unless (zilongshanren/packages-installed-p)
;;  (message "%s" "Refreshing package database...")
;;  (package-refresh-contents)
;;  (dolist (pkg zilongshanren/packages)
;;    (when (not (package-installed-p pkg))
;;      (package-install pkg))))
;;####################
;; smartparens
;;####################
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
;; 全局使用smartparens
(smartparens-global-mode t)

;;####################
;; swiper插件
;;####################

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;####################
;; 使用 js2-mode 打开 .js 文件
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(require 'nodejs-repl)

;;####################
;; 外观设置
;;####################
;; 加载主题
(load-theme 'monokai t)
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
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 禁止生成备份文件
(setq make-backup-files nil)
;; 文本中语法高亮
(require 'org)
(setq org-src-fontify-natively t)
;; 高亮匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 输入时删除选中的文本
;; (delete-selection-mode t)
;; 贪婪删除多余空白
(require 'hungry-delete)
(global-hungry-delete-mode)
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

;; 全局使用补全模式
(global-company-mode t)
;; smex补全M-x
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
					; when Smex is auto-initialized on its first run.
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
 
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



