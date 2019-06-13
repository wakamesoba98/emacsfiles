(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
  "Returns the name of the tab group names the current buffer belongs to.
There are two groups: Emacs buffers (those whose name starts with '*', plus
dired buffers), and the rest.  This works at least with Emacs v24.2 using
tabbar.el v1.7."
  (list (cond ((string-match "^direx:" (buffer-name)) "direx")
              ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))

(use-package tabbar
  :ensure t
  :init
  (tabbar-mode t)
  :config
  (tabbar-mwheel-mode nil)
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil)
                   (cons "" nil))))
  (custom-set-variables
   '(tabbar-separator '(1.0)))
  (set-face-attribute
   'tabbar-separator nil
   :foreground "Gray17"
   :height 1.0)
  (set-face-attribute ; バー自体の色
   'tabbar-default nil
   :background "Gray17"
   :family "Inconsolata"
   :height 1.0)
  (set-face-attribute ; アクティブなタブ
   'tabbar-selected nil
   :background "White"
   :foreground "Gray28"
   :weight 'normal
   :box nil)
  (set-face-attribute ; 非アクティブなタブ
   'tabbar-unselected nil
   :background "Gray53"
   :foreground "Gray17"
   :weight 'normal
   :box nil)
  (set-face-attribute ; 未保存のアクティブなタブ
   'tabbar-selected-modified nil
   :background "White"
   :foreground "OliveDrab"
   :weight 'normal
   :box nil)
  (set-face-attribute ; 未保存の非アクティブなタブ
   'tabbar-modified nil
   :background "Gray60"
   :foreground "DarkOliveGreen"
   :weight 'normal
   :box nil)
  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
  (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
  :bind
  ("<C-next>" . tabbar-forward)
  ("<C-prior>" . tabbar-backward))
