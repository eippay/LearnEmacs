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

(provide 'edit-code)
