;; テーマ
(require 'darcula-theme)
(load-theme 'darcula t)

(setq debug-on-error t)

;; 初期画面止める
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; ファイル末尾に改行を追加する
(setq require-final-newline t)

;; 選択後にキー入力で上書き
(delete-selection-mode 1)

;; インデント
(setq-default tab-width 2 indent-tabs-mode nil)
(setq js-indent-level 2)

;; 各種UI部品を無効
(tool-bar-mode 0)
(menu-bar-mode 0)

;; TRAMPのサイズ制限解除
(setq tramp-copy-size-limit nil)
(setq tramp-inline-compress-start-size nil)

;; undo-tree
(global-undo-tree-mode)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; 行番号
(if (version<= "26.0.50" emacs-version)
  (progn
    (global-display-line-numbers-mode)
    (set-face-foreground 'line-number "Gray53")
    (set-face-background 'line-number "Gray20"))
  (progn
    (require 'linum)
    (global-linum-mode 1)
    (setq linum-format "%3d ")
    (set-face-foreground 'linum "Gray53")
    (set-face-background 'linum "Gray20")))

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
(defun set-ediff-custom-colors ()
  (set-face-attribute 'ediff-current-diff-A nil :background "DarkRed")
  (set-face-attribute 'ediff-even-diff-A nil :background "DarkRed")
  (set-face-attribute 'ediff-odd-diff-A nil :background "DarkRed")
  (set-face-attribute 'ediff-fine-diff-A nil :background "Red3")
  (set-face-attribute 'ediff-current-diff-B nil :background "DarkGreen")
  (set-face-attribute 'ediff-even-diff-B nil :background "DarkGreen")
  (set-face-attribute 'ediff-odd-diff-B nil :background "DarkGreen")
  (set-face-attribute 'ediff-fine-diff-B nil :background "Green4"))
(add-hook 'ediff-load-hook 'scroll-all-mode)
(add-hook 'ediff-load-hook 'set-ediff-custom-colors)
(add-hook 'ediff-quit-hook (lambda () (scroll-all-mode -1)))

;; 括弧
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0.0)
(set-face-attribute 'show-paren-match nil :background "Gray24")
(set-face-attribute 'show-paren-mismatch nil :background "DarkOrange4")

;; 現在行
(global-hl-line-mode t)

;; windmove
(windmove-default-keybindings 'super)

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
