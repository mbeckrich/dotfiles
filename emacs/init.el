;;; package --- Summary -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Time-stamp: <2025-04-16 18:14:41 mkb>

;; Notes up top
;; Lots of this stuff originates, is inspired by, or is modified from the
;; configurations below:

;; https://github.com/renzmann/.emacs.d/blob/main/README.org
;; https://raw.githubusercontent.com/hrs/dotfiles/main/emacs/.config/emacs/configuration.org
;; https://config.daviwil.com/emacs
;; https://git.sr.ht/~protesilaos/dotfiles/tree/master/item/emacs/.emacs.d
;;   https://git.sr.ht/~protesilaos/basic-emacs/tree/main/item/basic-emacs.org
;; https://jamiecollinson.com/blog/my-emacs-config/
;; https://raw.githubusercontent.com/KaratasFurkan/.emacs.d/master/README.org
;; https://www.lucacambiaghi.com/vanilla-emacs/readme.html
;; https://github.com/Alexander-Miller/dotfiles
;; http://doc.norang.ca/org-mode.html
;; https://www.karsdorp.io/posts/dotemacs/#path
;; https://www.mattduck.com/emacs-fuzzy-launcher.html (emacs as Alfred
;;   replacement, cool!)
;;   https://xenodium.com/emacs-utilities-for-your-os/
;;   https://howardism.org/Technical/Emacs/capturing-content.html
;; https://github.com/novoid/dot-emacs/blob/master/config.org
;; https://github.com/konrad1977/emacs/blob/main/init.el
;; https://eshelyaron.com/esy.html
;; https://github.com/rougier/dotemacs/blob/master/dotemacs.org

(eval-when-compile
  (require 'use-package))

(use-package use-package
  :init
  (setq
   use-package-always-ensure t
   use-package-expand-minimally t
   use-package-verbose t))

(setenv "PATH" "/Users/mkb/.local/share/mise/installs/node/23.2.0/bin:/Users/mkb/.local/share/mise/installs/npm-prettier/3.3.3/bin:/Users/mkb/.gem/ruby/3.3.0/bin:/Users/mkb/.rubies/ruby-3.3.0/lib/ruby/gems/3.3.0/bin:/Users/mkb/.rubies/ruby-3.3.0/bin:/Users/mkb/.local/bin:/opt/homebrew/opt/python@3.12/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Applications/WezTerm.app/Contents/MacOS:/opt/homebrew/opt/fzf/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin")
(setq exec-path (split-string (getenv "PATH") path-separator))

(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-dragon t))

;;(use-package doom-themes
;;  :config
;;  (load-theme 'doom-flatwhite))

(set-face-attribute 'default nil
                    :family "Martian Mono"
                    :height 130)

(set-face-attribute 'fixed-pitch nil
                    :family "Martian Mono"
                    :height 130)

(set-face-attribute 'variable-pitch nil
                    :family "GT America LCG"
                    :height 160)

(use-package emacs
  :custom
  (backup-directory-alist       ; File name patterns and backup directory names.
        `(("." . ,(expand-file-name "backups" user-emacs-directory)))
        make-backup-files nil
        backup-by-copying t          ; Don't clobber symlinks
        version-control   t
        delete-old-versions t        ; Delete excess backup files silently
        kept-old-versions 2          ; Number of old versions to keep
        kept-new-versions 2          ; Number of new versions to keep
        delete-by-moving-to-trash t))

(use-package recentf
  :init
  (recentf-mode)
  :custom
  (recentf-max-menu-items 10
   recentf-max-saved-items 100))

(when (display-graphic-p)
  (context-menu-mode))

(use-package emacs
  :custom
  (completions-detailed              t)
  (completions-max-height            15)
  (enable-recursive-minibuffers      t)
  (pixel-scroll-precision-mode       t)
  (blink-cursor-mode nil)
  (display-time-mode t)
  (file-name-shadow-mode t)
  (minibuffer-depth-indicate-mode t)
  (show-paren-mode t)
  (use-short-answers t)
  (cursor-type '(hbar . 2))
  (cursor-in-non-selected-windows nil)
  (fill-column 72)
  (sentence-end-double-space nil)
  (tab-width 2)
	(tab-always-indent 'complete)
	(indent-tabs-mode nil)
  (x-underline-at-descent-line t)
  (help-window-select t)
  (ring-bell-function 'ignore)
  (user-full-name "Marshall Beckrich")
  (user-mail-address "m@mkb.sh")
  (setq-default
   command-line-default-directory    "~/")
  :hook
  (text-mode . auto-fill-mode)
  (before-save . delete-trailing-whitespace)
  (before-save . time-stamp)
  (tty-setup . xterm-mouse-mode))

(use-package display-line-numbers
  :config
  (setopt
   display-line-numbers-width 3)
  :hook
  (prog-mode . display-line-numbers-mode))

(use-package minions
  :config
  (minions-mode))

(setopt
 resize-mini-windows t
 visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(save-place-mode +1)

(delete-selection-mode t)

(use-package which-key
  :config
  (setopt
   which-key-sort-order 'which-key-key-order-alpha
   which-key-idle-delay 1)
  (which-key-mode +1))

(use-package vundo
  :config
  (setopt
   vundo-glyph-alist
   vundo-unicode-symbols)
  (define-key global-map [remap undo] 'vundo))

(when (display-graphic-p)
  (global-hl-line-mode))

(use-package magit
  :bind ("C-c g" . magit-status)
  :config
  (use-package git-commit)
  (use-package magit-section))

(use-package vertico
  :init
  (vertico-mode)
  :config
  (setopt
   vertico-count         8
   vertico-scroll-margin 0
   vertico-resize        t
   vertico-cycle         t))

(use-package orderless
  :after vertico
  :init
  (setopt
   completion-styles '(substring orderless basic)
   read-file-name-completion-ignore-case t
   read-buffer-completion-ignore-case t
   completion-ignore-case t)
  :custom
  (completion-category-overrides '((file (styles basic partial-completion))))
  :config
  (setopt
   orderless-component-separator "[ &]"))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode)
  :custom
  (history-length 25))

(use-package autorevert
  :ensure nil
  :config
  (global-auto-revert-mode +1)
  (setopt auto-revert-interval 2
          auto-revert-check-vc-info t
          auto-revert-verbose nil))

(use-package dired
  :ensure nil
  :custom
  (dired-recursive-copies 'always
   delete-by-moving-to-trash t
   dired-make-directory-clickable t))

(use-package tramp
  :defer t
  :config
  (setopt
   enable-remote-dir-locals nil
   tramp-verbose 1
   vc-handled-backends '(Git))
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  :custom
  (remote-file-name-inhibit-locks t))

(use-package ctrlf
  :init
  (ctrlf-mode))

(use-package emacs
  :config
  (setopt treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
    (cmake "https://github.com/uyha/tree-sitter-cmake")
    (css "https://github.com/tree-sitter/tree-sitter-css")
    (go "https://github.com/tree-sitter/tree-sitter-go")
    (html "https://github.com/tree-sitter/tree-sitter-html")
    (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    (json "https://github.com/tree-sitter/tree-sitter-json")
    (make "https://github.com/alemuller/tree-sitter-make")
    (markdown "https://github.com/ikatyang/tree-sitter-markdown")
    (python "https://github.com/tree-sitter/tree-sitter-python")
    (regex "https://github.com/tree-sitter/tree-sitter-regex")
    (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
    (toml "https://github.com/tree-sitter/tree-sitter-toml")
    (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
    (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
    (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))

(setq major-mode-remap-alist
 '((bash-mode   . bash-ts-mode)
   (css-mode    . css-ts-mode)
   (json-mode   . json-ts-mode)
   (python-mode . python-ts-mode)
   (regex-mode  . regex-ts-mode)
   (ruby-mode   . ruby-ts-mode)
   (scss-mode   . css-ts-mode)
   (toml-mode   . toml-ts-mode)
   (yaml-mode   . yaml-ts-mode)))

(use-package org
  :mode
  (("\\.org\\'" . org-mode)
   ("\\.txt\\'" . org-mode))
  :custom
  (org-agenda-breadcrumbs-separator "/")
  (org-agenda-start-on-weekyday     1))

(use-package prettier
  :after
  eglot)

(use-package markdown-mode
  :hook ((markdown-mode . visual-line-mode)))

(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)))

(use-package company
  :after
  eglot
  :hook
  (eglot . company-mode)
  :config
  (setq
   company-idle-delay        0.125
   company-show-quick-access t))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package flycheck
  :init
  (setq
   flycheck-check-syntax-automatically '(mode-enabled save))
  :config
  (global-flycheck-mode t))

(use-package eglot
  :hook
  (((css-mode json-mode python-mode ruby-mode scss-mode yaml-mode) . eglot))
  :custom
  (eglot-send-changes-idle-time 0.1))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x C-r") 'recentf-open)
(global-set-key (kbd "C-x C-p") 'previous-buffer)  ; Overrides `mark-page'
(global-set-key (kbd "C-x C-n") 'next-buffer)     ; Overrides `set-goal-column'
(global-set-key (kbd "s-/") 'comment-line)

(provide 'init.el)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad"
     default))
 '(package-selected-packages
   '(autothemer company ctrlf doom-themes expand-region flycheck
                kanagawa-themes magit marginalia markdown-mode minions
                orderless org prettier vertico vundo yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
