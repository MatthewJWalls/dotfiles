;; emacs configuration

;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; minimalist
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; turn on font-lock mode
(global-font-lock-mode t)
(transient-mark-mode 1)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq-default c-basic-offset 4)

;; scroll one line at a time
(setq scroll-step 1)

;; something
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-k\C-k")

;; linum mode
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)
(setq linum-format "%d ")

;; org mode
(setq load-path (cons "~/org-7.7/lisp" load-path))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; misc modes
(add-to-list 'load-path "~/emacsmodes/")
(load "csharp-mode-0.8.5")

(load "go-mode.el")
(load "php-mode.el")

;; simplified dired

(require 'dired-details+)

;; my bindings

(global-set-key (kbd "C-\\") 'indent-region)
(global-set-key (kbd "C-p") 'enlarge-window-horizontally)
(global-set-key (kbd "C-o") 'shrink-window-horizontally)

(global-set-key "\M-k" "\C-a\C-k")

;; package management

(require 'package)
(package-initialize)

(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; force saving temporary files to one specific backup directory

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

;; spaces instead of tabls

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

