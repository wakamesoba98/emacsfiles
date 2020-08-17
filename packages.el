(defvar repositories
  '(("gnu"       . "https://elpa.gnu.org/packages/")
    ("melpa"     . "https://melpa.org/packages/")))

(defvar packages
  '(darcula-theme
    use-package
    diminish
    undo-tree
    all-the-icons
    find-file-in-project
    neotree
    tabbar
    popwin
    dumb-jump
    clojure-mode
    cider
    clj-refactor
    ac-cider
    company
    markdown-mode
    yaml-mode
    vagrant-tramp
    ag
    python-mode
    jedi-core
    company-jedi
    virtualenvwrapper
    auto-virtualenvwrapper
    queue
    terraform-mode
    company-terraform))

;; リポジトリの設定
(require 'package)
(setq package-enable-at-startup nil)
(dolist (repo repositories)
  (add-to-list 'package-archives repo t))

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
