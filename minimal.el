;; テーマ
(require 'darcula-theme)

;; 初期画面止める
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; インデント
(setq-default tab-width 2 indent-tabs-mode nil)
(setq js-indent-level 2)

;; 各種UI部品を無効
(scroll-bar-mode -1)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; redo
(require 'redo+)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

;; 行番号
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%3d ")
(set-face-foreground 'linum "Gray53")
(set-face-background 'linum "Gray20")

;; kill buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; insert key を無効
(define-key global-map [(insert)] nil)
(define-key global-map [(control insert)] 'overwrite-mode)

;; C-t を無効化
(global-unset-key "\C-t")

;; C-h を Backspace にする
(global-set-key "\C-h" 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-highlight-all-diffs t)

;; 括弧
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0.0)
(set-face-background 'show-paren-match-face "Gray24")

;; 現在行
(global-hl-line-mode t)

;; 逆インデント
(global-set-key (kbd "<backtab>") 'un-indent-by-removing-2-spaces)
(defun un-indent-by-removing-2-spaces ()
  "remove 2 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^  ")
        (replace-match "")))))