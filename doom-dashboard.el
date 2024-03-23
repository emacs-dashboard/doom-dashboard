;;; doom-dashboard.el --- Doom dashboard style for emacs-dashboard  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  emacs-dashboard maintainers

;; Author: Elijah G. <eg642616@gmail.com>
;; URL: https://github.com/emacs-dashboard/doom-dashboard
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1") (dashboard "1.2.5"))
;; Keywords: convenience tools extension

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Doom Like style for `emacs-dashboard'
;;
;;; Code:
(require 'dashboard)

;;
;; User Options
;;

(defcustom doom-dashboard-homepage-footer-url
  "https://github.com/emacs-dashboard/emacs-dashboard"
  "URL to use for `dashboard-insert-homepage-footer'."
  :type '(string)
  :group 'dashboard)

(defcustom doom-dashboard-set-widget-binding t
  "If non-nil show keybindings in shortmenu widgets."
  :type 'boolean)

;;
;; Widget functions
;;

(defun doom-dashboard-insert-homepage-footer ()
  "Insert a homepage footer to go `doom-dashboard-homepage-footer-url'."
  (widget-create 'item
                 :tag dashboard-footer-icon
                 :action
                 (lambda (&rest _)
                   (browse-url doom-dashboard-homepage-footer-url))
                 :mouse-face 'highlight
                 :button-prefix ""
                 :button-suffix ""
                 :format "%[%t%]")
  (dashboard-center-text (- (point) 1) (point))
  (insert "\n"))

(defun doom-dashboard-insert-project-shortmenu (&rest _)
  "Insert project shortmenu widget."
  (let* ((fn #'project-switch-project)
         (fn-keymap (format "\\[%s]" fn))
         (icon-name (alist-get 'projects dashboard-heading-icons))
         (icon (nerd-icons-octicon icon-name :face 'dashboard-heading)))
    (if dashboard-display-icons-p
        (insert (format "%-3s" icon)))
    (widget-create 'item
                   :tag (format "%-30s" "Open project")
                   :action (lambda (&rest _)
                             (call-interactively #'project-switch-project))
                   :mouse-face 'highlight
                   :button-face 'dashboard-heading
                   :button-prefix ""
                   :button-suffix ""
                   :format "%[%t%]")
    (if doom-dashboard-set-binding
        (insert (propertize (substitute-command-keys fn-keymap)
                            'face
                            'font-lock-constant-face)))))

(defun doom-dashboard-insert-org-agenda-shortmenu (&rest _)
  "Insert `org-agenda' shortmenu widget."
  (let* ((fn #'org-agenda)
         (fn-keymap (format "\\[%s]" fn))
         (icon-name (alist-get 'agenda dashboard-heading-icons))
         (icon (nerd-icons-octicon icon-name :face 'dashboard-heading)))
    (if dashboard-display-icons-p
        (insert (format "%-3s" icon)))
    (widget-create 'item
                   :tag (format "%-30s" "Open org-agenda")
                   :action (lambda (&rest _)
                             (call-interactively #'org-agenda))
                   :mouse-face 'highlight
                   :button-face 'dashboard-heading
                   :button-prefix ""
                   :button-suffix ""
                   :format "%[%t%]")
    (if doom-dashboard-set-binding
        (insert (propertize (substitute-command-keys fn-keymap)
                            'face
                            'font-lock-constant-face)))))

(defun doom-dashboard-insert-bookmark-shortmenu (&rest _)
  "Insert bookmark shortmenu widget."
  (let* ((fn #'bookmark-jump)
         (fn-keymap (format "\\[%s]" fn))
         (icon-name (alist-get 'bookmarks dashboard-heading-icons))
         (icon (nerd-icons-octicon icon-name :face 'dashboard-heading)))
    (if dashboard-display-icons-p
        (insert (format "%-3s" icon)))
    (widget-create 'item
                   :tag (format "%-30s" "Jump to bookmark")
                   :action (lambda (&rest _)
                             (call-interactively #'bookmark-jump))
                   :mouse-face 'highlight
                   :button-face 'dashboard-heading
                   :button-prefix ""
                   :button-suffix ""
                   :format "%[%t%]")
    (if doom-dashboard-set-binding
        (insert (propertize (substitute-command-keys fn-keymap)
                            'face
                            'font-lock-constant-face)))))

(defun doom-dashboard-insert-recents-shortmenu (&rest _)
  "Insert recent files short menu widget."
  (let* ((fn #'recentf)
         (fn-keymap (format "\\[%s]" fn))
         (icon-name (alist-get 'recents dashboard-heading-icons))
         (icon (nerd-icons-octicon icon-name :face 'dashboard-heading)))
    (if dashboard-display-icons-p
        (insert (format "%-3s" icon)))
    (widget-create 'item
                   :tag (format "%-30s" "Recently opened files")
                   :action (lambda (&rest _)
                             (call-interactively #'recentf))
                   :mouse-face 'highlight
                   :button-face 'dashboard-heading
                   :button-prefix ""
                   :button-suffix ""
                   :format "%[%t%]")
    (if doom-dashboard-set-binding
        (insert (propertize (substitute-command-keys fn-keymap)
                            'face
                            'font-lock-constant-face)))))

(provide 'doom-dasbhoard)
;;; doom-dashboard.el ends here
