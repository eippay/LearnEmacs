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
(eippay-keybind "M-x" "cousel-M-x")
(eippay-keybind "C-x C-f" "cousel-find-file" "使用swiper打开文件")
(eippay-keybind "C-h f" "counsel-describe-function" "使用swiper查看函数文档")
(eippay-keybind "C-h v" "counsel-describe-variable" "swiper查看变量说明")
(eippay-keybind "C-h C-f" "find-function" "swiper定位函数定义")
(eippay-keybind "C-h C-v" "find-variable" "swiper定位变量定义")
(eippay-keybind "C-h C-k" "find-function-on-key" "swiper查看快捷键绑定函数")
(eippay-keybind "C-x p f" "counsel-git" "打开git同步的文件")


;;####################
;; popwin
;;####################
;; 光标自动跳转到提示窗口
(eippay-package-install 'popwin)
(require 'popwin)
(popwin-mode t)









(provide 'init-packages)
