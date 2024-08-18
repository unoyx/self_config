;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq backup-directory-alist `(("." . "~/.saves")))

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(setq package-check-signature nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e410458d3e769c33e0865971deb6e8422457fad02bf51f7862fa180ccc42c032" default))
 '(package-selected-packages
   '(modus-themes racket-mode eglot yasnippet-snippets jedi fic-mode iedit evil-leader ggtags projectile auto-complete evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'modus-vivendi)

(require 'ido)
(ido-mode 1)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)
(projectile-mode 1)
;; (load-theme 'ample t)

(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(define-key evil-motion-state-map "\C-u" 'evil-scroll-up)
(define-key evil-motion-state-map "\C-b" 'buffer-menu)

(setq projectile-sort-order 'recently-active)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)
(setq evil-search-wrap nil)

(require 'imenu-list)
(setq imenu-list-focus-after-activation t)
(add-hook 'imenu-list-after-jump-hook 'imenu-list-smart-toggle)

(require 'iedit)

(evil-leader/set-key
  "o" 'projectile-find-other-file
  "b" 'buffer-menu
  "a" 'ag-project
  "i" 'indent-region
  "f" 'projectile-find-file
  "h" 'highlight-symbol-at-point
  "m" 'imenu-list-smart-toggle
  "n" 'iedit-mode
  "x" 'iedit-toggle-selection
  "r" 'xref-find-references
  "H" 'unhighlight-regexp)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode)
(setq-default c-default-style "ellemtel"
              c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; (modify-syntax-entry ?_ "w" c-mode-syntax-table)
;; (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(add-hook 'c++-mode-hook (lambda ()
                           (modify-syntax-entry ?_ "w" c++-mode-syntax-table)))
(add-hook 'c-mode-hook (lambda ()
                         (modify-syntax-entry ?_ "w" c-mode-syntax-table)))
(add-hook 'python-mode-hook (lambda ()
                         (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

(add-hook 'racket-mode-hook (lambda ()
                              (dolist (char (list ?_ ?-))
                                (modify-syntax-entry char "w" racket-mode-syntax-table))))

(setq scroll-margin 0)
(setq scroll-conservatively 0)

(require 'ag)
(setq ag-reuse-buffers 't)

(global-whitespace-mode)
(setq whitespace-style '(tabs tab-mark trailing))
(require 'fic-mode)

(dolist (hook '(c++-mode-hook c-mode-hook python-mode-hook))
  (add-hook hook (lambda ()
                   (fic-mode 1))))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:environment-root "jedi")  ; or any other name you like
(setq jedi:environment-virtualenv (append '("virtualenv" "--system-site-packages" "--quiet")
                                          '("--python" "/usr/bin/python3")))

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "/usr/bin/clangd"))
(add-to-list 'eglot-server-programs '((racket-mode) "/usr/bin/racket" "-l" "racket-langserver"))
(add-to-list 'eglot-server-programs '((java-mode)
                                      "/usr/bin/java"
                                      "-Declipse.application=org.eclipse.jdt.ls.core.id1" 
                                      "-Dosgi.bundles.defaultStartLevel=4" 
                                      "-Declipse.product=org.eclipse.jdt.ls.core.product" 
                                      "-Dlog.level=ALL" 
                                      "-Xmx1G" 
                                      "--add-modules=ALL-SYSTEM" 
                                      "--add-opens" "java.base/java.util=ALL-UNNAMED" 
                                      "--add-opens" "java.base/java.lang=ALL-UNNAMED" 
                                      "-jar" "/home/unoyx/src/jdt/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar" 
                                      "-configuration" "/home/unoyx/src/jdt/config_linux" 
                                      "-data" "/home/unoyx/src/jdt/running_data"))
;; (add-to-list 'eglot-server-programs '((python-mode)  "pyright"))

(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'racket-mode-hook #'eglot-ensure)
;; (add-hook 'python-mode-hook #'eglot-ensure)
;; (add-hook 'java-mode-hook #'eglot-ensure)

(define-key ido-common-completion-map "\C-n" 'ido-next-match)
(define-key ido-common-completion-map "\C-p" 'ido-prev-match)

(setq load-path
      (cons (expand-file-name "~/src/llvm-project/llvm/utils/emacs/") load-path))
(require 'llvm-mode)
(require 'tablegen-mode)

(add-hook 'Buffer-menu-mode-hook (lambda ()
                                   (define-key Buffer-menu-mode-map (kbd "o") 'Buffer-menu-this-window)))

(add-hook 'Buffer-menu-mode-hook (lambda ()
                                   (evil-local-set-key 'motion (kbd "RET") 'Buffer-menu-this-window)))


