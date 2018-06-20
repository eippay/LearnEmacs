;;####################
;; org-mode 配置
;;####################
(require 'org)
;; 在编辑文本文件时，同样支持语法高亮
(setq org-src-fontify-natively t)
;; 任务计划管理
;; 配置任务计划存放 ~/org 目录
(setq org-agenda-files '("~/.emacs.d"))


;; 查看任务计划
;; (global-set-key (kbd "C-c a") 'org-agenda)
(eippay-keybind "C-c a" "org-agenda")

;; 配置org笔记功能
;; 生成 ~/.emacs.d/gtd.org 文件
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

;; 添加org记录
;; r remember
(append-keybind-strings
 ";; 记录org笔记"
 "(global-set-key (kbd \"C-c r\") 'org-capture)"
)
 
;; 安装番茄工作坊
(eippay-package-install 'org-pomodoro)
(require 'org-pomodoro)
;; 
 '(org-pomodoro-long-break-length 40)




;;####################
;; web-mode
;;####################
(eippay-package-install 'web-mode)
;; 调整缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 切换Tab为2个空格、4个空格
(defun my-toggle-web-indent ()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))

  (setq indent-tabs-mode nil))

(eippay-keybind "C-c t i" "my-toggle-web-indent" "切换tab 2 <=> 4")




;;####################
;; js2-refactor
;;####################
(eippay-package-install 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
;;####################
;; js2-mode
;; nodejs-repl
;;####################
;; javascript IDE
(eippay-package-install 'js2-mode)
(eippay-package-install 'nodejs-repl)
;; 使用 js2-mode 打开 .js 文件
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

(require 'nodejs-repl)


(provide 'init-mode)

