;; Python
(use-package company-jedi
  :after company
  :defer t
  :config
  (setq jedi:complete-on-dot t))

(use-package virtualenvwrapper
  :defer t)

(use-package auto-virtualenvwrapper
  :defer t)

(defun config/enable-company-jedi ()
  (add-to-list 'company-backends 'company-jedi))

(use-package python
  :init
  (add-hook 'python-mode-hook 'config/enable-company-jedi)
  (add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate)
  :config
  ;; https://github.com/jorgenschaefer/elpy/issues/887
  (setq python-shell-completion-native-enable nil))
