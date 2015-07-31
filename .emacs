;;; package --- summary
;;; Commentary:
;;; Code:
;; Package manager
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-enable-at-startup nil)

;; Activate installed packages
(package-initialize)

(defun ensure-package-installed (&rest packages)
"Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Packages you want to ensure to install
(ensure-package-installed 'zenburn-theme
			  'multi-term
			  'magit
			  'evil
			  'flycheck
			  'apache-mode
			  'syslog-mode
			  'php-mode
			  'projectile
			  'neotree
			  'smartparens
			  'aggressive-indent
			  'whitespace-cleanup-mode
			  'company
			  'js2-mode)

;; Show line numbers
(global-linum-mode t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; flycheck-mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Aggressive Indent Mode https://github.com/Malabarba/aggressive-indent-mode
(global-aggressive-indent-mode 1)
;;Example if I want to exclude certain modes (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;whitespace-cleanup-mode
(global-whitespace-cleanup-mode)

;; Smartparens
(smartparens-global-mode t)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Neotree set to projectil
(setq neo-theme 'ascii)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)

;; Start IDO
(ido-mode t)

;; Projectile
(projectile-global-mode)

;; Swap mac command and option keys for Meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; PHP Mode
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

;; Load zenburn theme
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "95a6ac1b01dcaed4175946b581461e16e1b909d354ada79770c0821e491067c6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)
;;; .emacs ends here
