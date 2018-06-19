;; 添加melpa源
;; 这是直接从https://melpa.org/#/getting-started复制的
(progn
  (require 'package)
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "https")))
    ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
    ;;(add-to-list 'package-archives (cons "melpa" (concat proto "//melpa.org/packages/")) t)
    ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
    (add-to-list 'package-archives (cons "melpa" (concat proto "://elpa.emacs-china.org/melpa/")) )

    (when (< emacs-major-version 24)
      ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
  (package-initialize)
)


;; 定义 eippay-package-install 用于安装扩展包
(progn
  (require 'cl)
  ;; package-auto-remove 会清理 package-selected-packages 中没有的插件
  (setq package-selected-packages nil)
  ;; 当插件未安装时，则安装插件
  (defun eippay-package-install (pkg &rest dependent-pkg-list)
    (setf dependent-pkg-list (reverse dependent-pkg-list))
    (dolist (dependent-pkg dependent-pkg-list)
	(eippay-package-install dependent-pkg))
    (pushnew pkg package-selected-packages)
    (unless (package-installed-p pkg)
      (message "%s" "Refreshing package database...")
      (package-refresh-contents)
      (message "installing %s ..." pkg)
      (package-install pkg)))
)

;; 在 init-keybinds.el 中按键绑定
(progn
  (eippay-package-install 'f)
  (require 'f)
  ;; 快捷键均在 init-keybinds.el 中定义
  (setf *eippay-keybind-file* "~/.emacs.d/lisp/init-keybinds.el")
  ;; 搜集快捷键，最后写入到 init-keybinds.el 中
  ;; 读取 lisp/init-keybinds 用户手工定义的按键绑定
  (setf *eippay-keybind-string* ";; 函数生成的按键绑定\n;;########################################")
  ;; 添加快捷键到 *eippay-keybind-string*
  (cl-defun append-keybind-string (str &optional (newline t))
    (when newline
      (setf *eippay-keybind-string* (concatenate 'string *eippay-keybind-string* "\n")))
    (setf *eippay-keybind-string* (concatenate 'string *eippay-keybind-string* str)))

  (cl-defun append-keybind-strings (&rest rest)
    (dolist (str rest)
      (append-keybind-string str)))


  ;; 函数eippay-keybind 添加快捷键到init-keybinds
  ;; (eippay-keybind "C-M-\\\\" "indent-region" "整理代码缩进")
  (cl-defun eippay-keybind (key fn &optional (comment-string ""))
    (unless (eql comment-string "")
      (append-keybind-string (concatenate 'string ";; " comment-string)))
    (append-keybind-string (concatenate 'string "(global-set-key (kbd \"" key "\") '" fn ")")))



  ;; 将*eippay-keybind-string* 写入到 init-keybinds
  (defun eippay-write-keybind ()
    (let ((comment-string ";; 用户手工定义的按键绑定（请勿更改本注释）"))
      (append-keybind-string "\n\n\n")
      (append-keybind-string comment-string nil)
      (append-keybind-string (cadr (split-string (f-read-text *eippay-keybind-file*) comment-string)) nil))
    (f-write-text *eippay-keybind-string* 'utf-8 *eippay-keybind-file*))

  (eippay-keybind "C-M-\\\\" "indent-region")
)


(provide 'init-start)
