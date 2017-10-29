;; Clojure
(use-package clojure-mode
  :defer t
  :init
  (add-hook 'clojure-mode-hook 'yas-minor-mode)
  (add-hook 'clojure-mode-hook 'subword-mode))

(use-package cider
  :defer t
  :init
  (add-hook 'cider-mode-hook 'clj-refactor-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook 'eldoc-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        cider-overlays-use-font-lock t
        company-idle-delay 0
        company-minimum-prefix-length 2
        company-selection-wrap-around t)
  (cider-repl-toggle-pretty-printing))

(use-package clj-refactor
  :defer t
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "M-RET"))

(use-package company
  :defer t
  :bind
  (:map company-active-map
        ([tab] . company-complete-selection)))

(defun cider-connect-from-local-file ()
  (interactive)
  (cider-version)
  (let ((host (shell-command-to-string "vagrant ssh -c 'hostname | cut -d \" \" -f 2 | tr -d \"\n\"'"))
        (port (nth 1 (car (cider-locate-running-nrepl-ports)))))
    (cider-connect host port)
    (cider-load-all-project-ns)))
(global-set-key (kbd "C-c M-v") 'cider-connect-from-local-file)
