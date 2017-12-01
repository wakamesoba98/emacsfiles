(use-package popwin
  :config
  (popwin-mode 1)
  (push '("\\*cider-repl" :regexp t :position right :width 80) popwin:special-display-config))
