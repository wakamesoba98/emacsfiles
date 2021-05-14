(use-package find-file-in-project
  :ensure t
  :defer t
  :config
  (add-to-list 'ffip-prune-patterns "*/out/*")
  (add-to-list 'ffip-prune-patterns "*target/*")
  (when (eq system-type 'windows-nt) (setq ffip-find-executable "\"c:\\\\Program Files\\\\Git\\\\usr\\\\bin\\\\find.exe\""))
  :bind
  ("<C-return>" . find-file-in-project))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ignore-errors (ffip-project-root)))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (neotree-find file-name))))

(use-package all-the-icons
  :defer t)

(use-package neotree
  :ensure t
  :defer t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  :bind
  ("C-x C-d" . neotree-project-dir))
