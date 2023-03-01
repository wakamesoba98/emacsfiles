(use-package dockerfile-mode
  :defer t
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package docker-compose-mode
  :defer t)

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))
