;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :commands
  (markdown-mode gfm-mode)
  :mode
  ("\\.md\\'" . gfm-mode)
  ("\\.markdown\\'" . gfm-mode))

;; browse-url
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")
(when (eq system-type 'windows-nt)
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "c:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe"))
(global-set-key (kbd "C-c C-c C-p") 'browse-url-of-file)

;; YAML
(use-package yaml-mode
  :ensure t
  :defer t
  :mode
  ("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
  (lambda ()
    (and (string= (file-name-base) "vault") (ansible-vault-mode 1))))

;; CSS
(setq css-indent-offset 2)

;; dumb-jump: 関数宣言まで移動
(use-package dumb-jump
  :defer t
  :bind
  ([(super b)] . dumb-jump-go)
  ([(super shift b)] . dumb-jump-back)
  :config
  (setq dumb-jump-mode t
        dumb-jump-selector 'ivy
        dumb-jump-use-visible-window nil))

;; Ivy
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1))

;; LaTeX
(defun pd ()
  (interactive)
  (save-buffer)
  (let ((filename (buffer-file-name (window-buffer (minibuffer-selected-window)))))
    (message (shell-command-to-string (concat "uplatex " filename " && dvipdfmx $(echo " filename " | sed -e s/\.tex$/.dvi/)")))))

(defun png2xbb ()
  (interactive)
  (message (shell-command-to-string (concat "find ./png/ -type f -regextype posix-basic -regex '.*.\\(png\\|jpg\\)' -exec extractbb {} \\;"))))

;; デーモンを起動
(require 'server)
(unless (server-running-p)
  (server-start))
