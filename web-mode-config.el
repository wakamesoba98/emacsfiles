(use-package web-mode
  :ensure t
  :defer t
  :config
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 2)
  (set (make-local-variable 'company-backends) '(company-web-html))
  (company-mode t)
  :mode
  ("\\.\\(html\\|xhtml\\|shtml\\|tpl\\)\\'" . web-mode))
