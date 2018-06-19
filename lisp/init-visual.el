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

;;####################
;; evil-surround
;;####################
;; viw" cs'"
(eippay-package-install 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)
(append-keybind-strings
 ";; viws	修改单词"
 ";; viwS'	word => 'word'"
 ";; viw\"	word => \"word\""
 ";; cs'\"	'word' => \"word\""
 ";; cs'(	'word' => ( word )"
 ";; cs')	'word' => (word)"
 )

(provide 'init-visual)
