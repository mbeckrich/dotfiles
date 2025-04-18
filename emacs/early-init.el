;;; early-init.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Prevent emacs from jumping around on start due to differences in
;; font/bar size in config vs. what it wants to do.

(setq
 frame-resize-pixelwise       t
 frame-inhibit-implied-resize t)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements
;; early. From nano emacs.

(setq default-frame-alist
      (append (list
               '(ns-transparent-titlebar . t)
               '(ns-appearance           . dark)
               '(min-height              . 1)
               '(height                  . 45)
               '(min-width               . 1)
               '(width                   . 81)
               '(vertical-scroll-bars    . nil))))

(setopt
 confirm-nonexistent-file-or-buffer nil
 indicate-empty-lines nil
 initial-buffer-choice nil
 initial-scratch-message nil
 inhibit-startup-screen t
 inhibit-startup-message t
 pop-up-windows nil
 use-dialog-box nil
 use-file-dialog nil)

(setq
 frame-title-format                 nil
 ns-use-proxy-icon                  nil)

(setq
 window-divider-default-right-width  2
 window-divider-default-bottom-width 2
 window-divider-default-places t)
(window-divider-mode 1)

(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(if (fboundp #'scroll-bar-mode)
    (set-scroll-bar-mode nil))

(if (fboundp #'tool-bar-mode)
    (tool-bar-mode -1))

;; Mac specific
(when (eq system-type 'darwin)
  (setq
   ns-pop-up-frames         nil
   ns-use-native-fullscreen t
   ns-command-modifier     'meta
   ns-option-modifier      'super))

(setopt
 package-archives
 '(("elpa"   . "https://elpa.gnu.org/packages/")
   ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ("melpa"  . "https://melpa.org/packages/")))

(setq
 user-emacs-directory "~/.config/emacs/")

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))

;;; early-init.el ends here
