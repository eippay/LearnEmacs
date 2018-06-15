;;####################
;; company 用于自动补全
;;####################
(eippay-package-install 'company)
;; 全局使用补全模式
(global-company-mode t)

;;####################
;; hungry-delete 贪婪删除多余空白
;;####################
(eippay-package-install 'hungry-delete)
;; 全局开启贪婪删除空白
(global-hungry-delete-mode)


;;####################
;; smartparens
;;####################
;; 自动为"("输入匹配的")"
;; (eippay-package-install 'smartparens)
;; 全局使用smartparens
;; (smartparens-global-mode t)

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

(provide 'edit-code)
