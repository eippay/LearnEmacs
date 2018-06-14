
;; 添加melpa源
;; 这是直接从https://melpa.org/#/getting-started复制的
(progn
  (require 'package)
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "https")))
    ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
    (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
    ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
    (when (< emacs-major-version 24)
      ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
  (package-initialize)
)

;; 定义 eippay/package-installing 用于安装扩展包
(progn
  ;; 导入 common lisp 库
  (require 'cl)
  ;; package-auto-remove 会清理 package-selected-packages 中没有的插件
  (setq package-selected-packages nil)
  ;; 当插件未安装时，则安装插件
  (defun eippay/package-installing (pkg &optional dependent-pkg)
    (if dependent-pkg
	(eippay/package-installing dependent-pkg))
    (pushnew pkg package-selected-packages)
    (unless (package-installed-p pkg)
      (message "%s" "Refreshing package database...")
      (package-refresh-contents)
      (message "installing %s ..." pkg)
      (package-install pkg)))
  ;; 在 init-keybinds.el 中按键绑定
  (eippay/package-installing 'f)
  (setf *keybind-list* nil)
  
  (defun eippay/keybind (string key fn)
   (pushnew (concatenate 'string ";; " string) *keybind-list*)
   (pushnew (concatenate 'string "global-set-key (kbd " key ") " (format nil "'~a" fn)) *keybind-list*))
  
  (defun write-keybinds ()
    (dolist (line *keybind-list*)
      (f-write-text line 'utf-8 "~/.emacs.d/lisp/init-keybinds.el")))
  )



;;####################
;; company 用于自动补全
;;####################
(eippay/package-installing 'company)
;; 全局使用补全模式
(global-company-mode t)

;;####################
;; monokai-theme 提供主题
;;####################
(eippay/package-installing 'monokai-theme)
;; 加载主题
(load-theme 'monokai t)

;;####################
;; hungry-delete 贪婪删除多余空白
;;####################
(eippay/package-installing 'hungry-delete)
;; 全局开启贪婪删除空白
(global-hungry-delete-mode)

;;####################
;; swiper
;;####################
;; 优化minibuffer
;; swiper 依赖于 counsel
(eippay/package-installing 'swiper 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v")'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;;####################
;; smartparens
;;####################
;; 自动为"("输入匹配的")"
(eippay/package-installing 'smartparens)
;; 全局使用smartparens
(smartparens-global-mode t)


;;####################
;; js2-mode
;; nodejs-repl
;;####################
;; javascript IDE
(eippay/package-installing 'js2-mode)
(eippay/package-installing 'nodejs-repl)
;; 使用 js2-mode 打开 .js 文件
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(require 'nodejs-repl)

;;####################
;; popwin
;;####################
;; 光标自动跳转到提示窗口
(eippay/package-installing 'popwin)
(require 'popwin)
(popwin-mode t)



;;####################
;; 清除未使用的插件
;;####################
(package-autoremove)

;;####################
;; 添加快捷键
;;####################

(provide 'init-packages)
