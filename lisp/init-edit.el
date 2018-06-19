;; 函数用于缩进选区
(defun indent-buffer ()
  " 缩进选区"
  (interactive)
  (if (region-active-p)
      (indent-region (region-beginning) (region-end))
    (indent-region (point-min) (point-max))))
;; C-M-\ 整理代码缩进
(global-set-key (kbd "C-M-\\") 'indent-buffer)


;;####################
;; hungry-delete 贪婪删除多余空白
;;####################
(eippay-package-install 'hungry-delete)
;; 全局开启贪婪删除空白
(global-hungry-delete-mode)


;; 光标在括号旁边时，高亮匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 光标在括号之间时，高亮括号
(define-advice show-paren-function (:around (fn) fix-show-paren-funciton)
  "Highlight enclosing parens"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
;;####################
;; smartparens
;;####################
;; 自动为"("输入匹配的")"
(eippay-package-install 'smartparens)
;; 全局使用smartparens
(smartparens-global-mode t)
;; 禁止匹配 ' 为 ''
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)



;;####################
;; company 用于自动补全
;;####################
(eippay-package-install 'company)
;; 全局使用补全模式
(global-company-mode t)


;;####################
;; 使用 hippie 补全
;;####################
;; 添加补全搜索范围
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))
;; 使用 M-/ 绑定补全
(eippay-keybind "M-/" "hippie-expand" "hippie补全")


;;####################
;; evil-nerd-commenter
;;####################
;; 方便添加注释
(eippay-package-install 'evil-nerd-commenter)
(evilnc-default-hotkeys)
;; 添加注释
(append-keybind-strings
 ";; ,/ 添加注释"
 "(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)"
 ";; 在visual模式下添加注释"
 "(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)")

(provide 'init-edit)
