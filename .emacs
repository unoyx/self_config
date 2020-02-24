;; (add-to-list 'load-path "/home/shanh/.emacs.d/scripts/ample-theme")
;; (add-to-list 'custom-theme-load-path "/home/shanh/.emacs.d/scripts/ample-theme")
(add-to-list 'load-path "/home/shanh/.emacs.d/scripts/emacs-ccls")
;; (add-to-list 'load-path "/home/shanh/.emacs.d/scripts/ag.el")
;; (add-to-list 'load-path "/home/shanh/.emacs.d/scripts/lsp-mode")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(setq package-check-signature nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-leader ggtags projectile auto-complete evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'ido)
(ido-mode 1)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)
(projectile-mode 1)
(load-theme 'ample t)

(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(define-key evil-motion-state-map "\C-u" 'evil-scroll-up)
(define-key evil-motion-state-map "\C-b" 'buffer-menu)

(evil-leader/set-key
  "o" 'projectile-find-other-file
  "b" 'buffer-menu
  "a" 'ag-project
  "i" 'indent-region
  "f" 'projectile-find-file-in-known-projects)

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

(setq scroll-margin 0)
(setq scroll-conservatively 0)

(require 'lsp-mode)
(add-hook 'c++-mode-hook #'ggtags-mode)
(add-hook 'python-mode-hook #'lsp)
;; (require 'ccls)
;; (setq ccls-executable "/home/shanh/src/ccls/Release/ccls")

;; (require 'elpy)
;; (elpy-enable)

(require 'ag)
