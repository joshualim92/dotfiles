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
  "Assure every PACKAGES is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Packages you want to ensure to install
(ensure-package-installed 'ace-jump-mode
                          'ag
                          'aggressive-indent
                          'apache-mode
                          'back-button
                          'buffer-move
                          'company
                          'elscreen
                          'emr
                          'exec-path-from-shell
                          'evil
                          'flycheck
                          'flx-ido
                          'groovy-mode
                          'ido-vertical-mode
                          'impatient-mode
                          'import-js
                          'js2-mode
                          'js2-refactor
                          'magit
                          'mocha
                          'multi-term
                          'multiple-cursors
                          'neotree
                          'php-mode
                          'powerline
                          'powerline-evil
                          'projectile
                          'sbt-mode
                          'smartparens
                          'smex
                          'syslog-mode
                          'tdd
                          'web-mode
                          'whitespace-cleanup-mode
                          'zenburn-theme)

;; Add to PATH for emacs env
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Swap mac command and option keys for Meta
(setq mac-control-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'control)

;; Bypass OS X keybindings
(setq mac-pass-command-to-system nil)

;; Allow copy and paste to clipboard
(setq x-select-enable-clipboard t)

;; Backward-kill-word to C-w
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; Fullscreen
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; buffer-move
(global-set-key (kbd "C-c b p") 'buf-move-up)
(global-set-key (kbd "C-c b n") 'buf-move-down)
(global-set-key (kbd "C-c b b") 'buf-move-left)
(global-set-key (kbd "C-c b f") 'buf-move-right)

;; Window resize keybindings
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Remove UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Set Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(100 100))
;; (add-to-list 'default-frame-alist '(alpha 100 100))
;; Transparency toggle
;; (eval-when-compile (require 'cl))
;; (defun toggle-transparency ()
;;   (interactive)
;;   (if (/=
;;        (cadr (frame-parameter nil 'alpha))
;;        100)
;;       (set-frame-parameter nil 'alpha '(100 100))
;;     (set-frame-parameter nil 'alpha '(90 75))))
;; (global-set-key (kbd "C-c t") 'toggle-transparency)

;; Winner Mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Show line numbers
(global-linum-mode t)

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Save backup files in a dedicated directory
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Use zsh
(defvar multi-term-program)
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; Don't swtich terminals after closing one
(setq multi-term-switch-after-close nil)

;; Add keybinding for term-line-mode
(add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))

;; Add esc key as C-c C-e
(require 'multi-term)
(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))
(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))

(add-hook 'term-mode-hook 'my-inhibit-global-linum-mode)

(defun my-inhibit-global-linum-mode ()
  "Counter-act 'global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
            (lambda () (linum-mode 0))
            :append :local))

;; Shortcut for switching buffers
(global-set-key (kbd "M-<tab>") 'previous-buffer)
(global-set-key (kbd "M-S-<tab>") 'next-buffer)

;; Evil-mode
(require 'evil)
(evil-mode t)
(setq evil-default-state 'emacs) ; start evil-mode in emacs mode.  Only toggle on with C-z
(add-to-list 'evil-emacs-state-modes 'undo-tree-mode)

(global-set-key (kbd "C-x /") 'undo-tree-redo)

;; Powerline
(require 'powerline)
(powerline-default-theme)
;;(powerline-evil-vim-color-theme)

;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet"
             "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode 1)

;; Org Mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"))

;; ElScreen
(require 'elscreen)
(setq elscreen-prefix-key "\C-c\z")
(setq elscreen-display-tab 'nil)
(elscreen-start)

;; Emacs Refactor
(define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(add-hook 'prog-mode-hook 'emr-initialize)

;; flycheck-mode
(add-hook 'after-init-hook #'global-flycheck-mode)
;; Aggressive Indent Mode https://github.com/Malabarba/aggressive-indent-mode
(global-aggressive-indent-mode)
;;Example if I want to exclude certain modes (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;;whitespace-cleanup-mode
(global-whitespace-cleanup-mode)

;; Smartparens
(smartparens-global-mode t)

;; Hide Show Minor Mode
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Start IDO
(require 'ido-vertical-mode)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)
(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Start smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Projectile
(require 'projectile)
(projectile-mode)
(setq projectile-enable-caching t)

;; Neotree set to projectile
(require 'neotree)
(setq neo-theme 'ascii)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Avy
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-\"") 'avy-goto-line)

;; Ace Jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; Back Button
(require 'back-button)
(back-button-mode 1)

;; groovy-mode
(add-to-list 'auto-mode-alist '("\\.gsp\\'" . groovy-mode))

;; tern
(add-to-list 'load-path "~/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default indent-tabs-mode nil)

;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; PHP Mode
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Function to show ansi colour in compilation buffer
(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

;; Load zenburn theme
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows (quote all-frames))
 '(avy-background t)
 '(compilation-environment (quote ("NPM_TOKEN=0d21a463-c936-43b3-8589-73cf24e70a2f")))
 '(css-indent-offset 4)
 '(custom-safe-themes
   (quote
    ("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "95a6ac1b01dcaed4175946b581461e16e1b909d354ada79770c0821e491067c6" default)))
 '(flx-ido-mode t)
 '(global-aggressive-indent-mode t)
 '(global-company-mode t)
 '(js-indent-level 4)
 '(js2-bounce-indent-p t)
 '(package-selected-packages
   (quote
    (avy ace-jump-mode mocha guess-offset smart-tab zenburn-theme whitespace-cleanup-mode web-mode w3m tdd syslog-mode smex smartparens sbt-mode powerline-evil php-mode nvm neotree multi-term magit js2-refactor impatient-mode ido-vertical-mode groovy-mode flycheck flx-ido exec-path-from-shell emr elscreen company back-button apache-mode aggressive-indent ag)))
 '(projectile-mode t nil (projectile))
 '(smartparens-global-mode t)
 '(tab-width 4)
 '(tdd-mode t))

(provide '.emacs)
;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
