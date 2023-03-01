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
    ivy
    markdown-mode
    yaml-mode
    web-mode
    vagrant-tramp
    ag
    python-mode
    jedi-core
    company-jedi
    virtualenvwrapper
    auto-virtualenvwrapper
    queue
    terraform-mode
    company-terraform
    rust-mode
    ansible-vault
    dockerfile-mode
    docker-compose-mode
    kubernetes))

;; リポジトリの設定
(require 'package)
(setq package-enable-at-startup nil)
(dolist (repo repositories)
  (add-to-list 'package-archives repo t))

(defun auto-install ()
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(auto-install)

;; use-package を有効化
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
