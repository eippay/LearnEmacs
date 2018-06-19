;;####################
;; 配置Dirt
;;####################
;; 复制目录时，总是递归复制目录内容
(setq dired-recursive-copies 'always)
;; 删除目录时，总是递归删除目录内容
(setq dired-recursive-deletes 'always)
;; 不让Dirt不断创建新的buffer
(put 'dired-find-alternate-file 'disable nil)
;; 禁止在dired中回车时创建新的buffer
;; 加载dired文件后，自动执行(define-key ...)语句，而不是在启动时加载该语名
;; with-eval-after-load提高了Eamcs加载速度

(append-keybind-strings
 ";; 禁止在dired中回车时创建新的buffer"
 "(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd \"RET\") 'dired-find-alternate-file))")
(append-keybind-strings
";; C-x C-j 打开当前buffer对应的目录"
"(require 'dired-x)")
;; 方便在两个dired窗格间复制文件
(setq dired-dwim-target t)



;;####################
;; swiper
;;####################
;; 优化minibuffer
;; swiper 依赖于 counsel
(eippay-package-install 'swiper 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(eippay-keybind "\\C-s" "swiper" "使用swiper搜索")
(eippay-keybind "C-c C-r" "ivy-resume")
(eippay-keybind "<f6>" "ivy-resume")
(eippay-keybind "M-x" "counsel-M-x")
(eippay-keybind "C-x C-f" "counsel-find-file" "使用swiper打开文件")
(eippay-keybind "C-h f" "counsel-describe-function" "使用swiper查看函数文档")
(eippay-keybind "C-h v" "counsel-describe-variable" "swiper查看变量说明")
(eippay-keybind "C-h C-f" "find-function" "swiper定位函数定义")
(eippay-keybind "C-h C-v" "find-variable" "swiper定位变量定义")
(eippay-keybind "C-h C-k" "find-function-on-key" "swiper查看快捷键绑定函数")
(eippay-keybind "C-c p f" "counsel-git" "打开git同步的文件")

;;####################
;; helm-ag 内容搜索
;;####################
(eippay-package-install 'helm-ag)
(append-keybind-strings
 ";; helm-ag 搜索文档内容"
 "(global-set-key (kbd \"C-c p s\") 'helm-do-ag-project-root)"
 )



;;####################
;; occur 搜索
;;####################
(defun occur-dwim ()
  "Call 'occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(append-keybind-strings
 ";; occur 搜索"
 "(global-set-key (kbd \"M-s o\") 'occur-dwim)"
 )




(provide 'init-findfile)
