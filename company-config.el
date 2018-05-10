;; company
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-show-numbers t ;; Easy navigation to candidates with M-<n>
        company-idle-delay 0
        company-minimum-prefix-length 0
        company-selection-wrap-around t)
  (bind-keys :map company-active-map
             ([tab] . company-complete-selection)))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode t))
