;; カーソル
(setq-default cursor-type '(bar . 3))
(set-cursor-color "LightGray")

;; 最大化して起動
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; フォント
(when (>= emacs-major-version 24)
  (set-face-attribute 'default nil :family "Source Code Pro" :height 108)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "VL ゴシック")))
