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
(setq evil-want-C-u-scroll t)


;;####################
;; evil-leader
;;####################
(eippay-package-install 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  )


(provide 'init-interactive)
