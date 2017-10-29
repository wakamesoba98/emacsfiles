(defvar repositories
  '(("melpa"     . "http://melpa.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("gnu"       . "http://elpa.gnu.org/packages/")))

(defvar packages
  '(use-package
    redo+
    darcula-theme
    all-the-icons
    find-file-in-project
    neotree
    tabbar
    clojure-mode
    cider
    clj-refactor
    ac-cider
    company
    markdown-mode
    yaml-mode
    vagrant-tramp
    ag))

;; リポジトリの設定
(require 'package)
(setq package-enable-at-startup nil)
(dolist (repo repositories)
  (add-to-list 'package-archives repo))
(package-initialize)

;; 自動でパッケージを入れる
(require 'cl)
(defun auto-install ()
  (let ((not-installed (remove-if #'package-installed-p packages)))
    (when not-installed
      (package-refresh-contents)
      (dolist (pkg not-installed)
        (package-install pkg)))))

(auto-install)

;; use-package を有効化
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)