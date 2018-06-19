;; 选区背景颜色
(set-face-background 'region "#5499c7")

;; 输入时删除选中的文本
(delete-selection-mode t)

;; 按 ( ) 选择选区
(eippay-package-install 'expand-region)
(require 'expand-region)
;;(global-set-key (kbd "C-=") 'er/expand-region)
(eippay-keybind "C-=" "er/expand-region" "选区匹配")

;;####################
;; iedit 同时编辑
;;####################
(eippay-package-install 'iedit)
;; (global-set-key (kbd "M-s e") 'iedit-mode)
(eippay-keybind "M-s e" "iedit-mode" "多选区同时编辑")
(eippay-keybind "C-;" "iedit-mode" "多选区同时编辑")



(provide 'init-visual)
