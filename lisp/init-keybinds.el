;; 函数生成的按键绑定
;;########################################
(global-set-key (kbd "C-M-\\") 'indent-region)
;; 使用swiper搜索
(global-set-key (kbd "\C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'cousel-M-x)
;; 使用swiper打开文件
(global-set-key (kbd "C-x C-f") 'cousel-find-file)
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
(global-set-key (kbd "C-x p f") 'counsel-git)



;; 用户手工定义的按键绑定（请勿更改本注释）
;;########################################


;; 函数用于打开 init.el 文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; <F2> 配置 init.el 文件
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 函数用于自动缩进选区
(defun indent-buffer ()
  "自动缩进选区"
  (interactive)
  (indent-region (region-beginning) (region-end)))
;; C-M-\ 整理代码缩进
(global-set-key (kbd "C-M-\\") 'indent-region)


(provide 'init-keybinds)
