;; company
(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-show-numbers t ;; Easy navigation to candidates with M-<n>
        company-idle-delay 0
        company-minimum-prefix-length 1
        company-selection-wrap-around t)
  (bind-keys :map company-active-map
             ([tab] . company-complete-selection)))

(use-package company-quickhelp
  :ensure t
  :defer t
  :after company
  :config
  (company-quickhelp-mode t))

;; Terraform
(use-package company-terraform
  :defer t
  :init (company-terraform-init))

;; HTML
(use-package company-web-html
  :defer t)
