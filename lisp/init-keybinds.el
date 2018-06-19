;; 函数生成的按键绑定
;;########################################
(global-set-key (kbd "C-M-\\") 'indent-region)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
;; 切换tab 2 <=> 4
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;; 禁止在dired中回车时创建新的buffer
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; C-x C-j 打开当前buffer对应的目录
(require 'dired-x)
;; 使用swiper搜索
(global-set-key (kbd "\C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
;; 使用swiper打开文件
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; 使用swiper查看函数文档
(global-set-key (kbd "C-h f") 'counsel-describe-function)
;; swiper查看变量说明
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;; swiper定位函数定义
(global-set-key (kbd "C-h C-f") 'find-function)
;; swiper定位变量定义
(global-set-key (kbd "C-h C-v") 'find-variable)
;; swiper查看快捷键绑定函数
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;; 打开git同步的文件
(global-set-key (kbd "C-c p f") 'counsel-git)
;; helm-ag 搜索文档内容
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
;; occur 搜索
(global-set-key (kbd "M-s o") 'occur-dwim)
;; hippie补全
(global-set-key (kbd "M-/") 'hippie-expand)
;; 选区匹配
(global-set-key (kbd "C-=") 'er/expand-region)
;; 多选区同时编辑
(global-set-key (kbd "M-s e") 'iedit-mode)
;; 多选区同时编辑
(global-set-key (kbd "C-;") 'iedit-mode)



;; 用户手工定义的按键绑定（请勿更改本注释）
;;########################################


;; 函数用于打开 init.el 文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; <F2> 配置 init.el 文件
(global-set-key (kbd "<f2>") 'open-my-init-file)


(provide 'init-keybinds)
