;; 简化 yes or no 为 y or n
(fset 'yes-or-no-p 'y-or-n-p)


;; 显示最近打开的文件
(require 'recentf)
;; 在 [File] => [File Recent] 里保存最近打开文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(append-keybind-strings
 ";; C-x C-r 查看最近打开的文件"
 "(global-set-key \"\\C-x\\ \\C-r\" 'recentf-open-files)"
)

;; 禁止生成备份文件
(setq make-backup-files nil)
;; 关闭自动保存功能（Emacs默认300个字符会生成#file-name#文件）
(setq auto-save-default nil)


;;####################
;; popwin
;;####################
;; 光标自动跳转到提示窗口
(eippay-package-install 'popwin)
(require 'popwin)
(popwin-mode t)


;;####################
;; evil 模拟vim
;;####################
(eippay-package-install 'evil)
(evil-mode 1)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; 需使用 customize-group 配置才生效
(setq evil-want-C-u-scroll t)
;; insert模式下，C-z => Emacs模式
;; (global-set-key (kbd "C-z") 'evil-emacs-state)

;;####################
;; evil-leader
;;####################
(eippay-package-install 'evil-leader)
(global-evil-leader-mode)
;; 设置空格为leader键
(setq evil-leader/leader "SPC")
;; 配置快捷键
(evil-leader/set-key
  "bk"  'kill-buffer
  "bb"  'switch-to-buffer
  "fr"  'recentf-open-files
  "ff"  'find-file
  "pf"  'counsel-git
  "ps"  'helm-do-ag-project-root
  "1"   'select-window-1
  "2"   'select-window-2
  "3"   'select-window-3
  "4"   'select-window-4 
  "w/"  'split-window-right
  "w-"  'split-window-below
  ":"   'counsel-M-x
  "wm"  'delete-other-windows
  "w4"  'split-window-4
  )

;; 分割4个窗格
(defun split-window-4 (&optional size)
  (interactive)
  (save-excursion
   (split-window-below size)
   (split-window-right size)
   (other-window 2)
   (split-window-right size)
   (select-window-1)
   )
  )

;;####################
;;which-key
;;####################
;; 快捷按键逐步提示
(eippay-package-install 'which-key)
(which-key-mode 1)


(provide 'init-interactive)
