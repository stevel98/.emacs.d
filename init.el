(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq default-directory "~/")
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(show-paren-mode 1)
(electric-pair-mode 1)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 83))

(require 'package)
(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize) ; guess what this one does ?

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-char-timer)
  )

(use-package avy :ensure t
  :commands (avy-goto-char-timer))

(use-package counsel :ensure t)
(use-package swiper :ensure t)

(general-define-key
  ;; replace default keybindings
  "C-s" 'swiper             ; search for string in current buffer
  "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
  )

(use-package which-key :ensure t)
(general-define-key
 :prefix "C-c"
 ;; bind to simple key press
  "b"	'ivy-switch-buffer  ; change buffer, chose using ivy
  "/"   'counsel-git-grep   ; find string in git project
  ;; bind to double key press
  "f"   '(:ignore t :which-key "files")
  "ff"  'counsel-find-file
  "fr"	'counsel-recentf
  "p"   '(:ignore t :which-key "project")
  "pf"  '(counsel-git :which-key "find file in git dir")
  )

(setq kotlin-tab-width 4)

(which-key-mode)
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("543fd63f9763930324ca0f5e63ae2b670925156c5eff6c70fa2578977eba2b01" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "9240e71034689655a6c05c04063af2c90d0a831aa4e7ca24c8b6e29b5a2da946" "4ad63526fc7cc542a258977a4b92c9709611720f7207164aa9df416dc0024be8" default)))
 '(package-selected-packages
   (quote
    (js2-mode company which-key counsel swiper kotlin-mode haskell-mode challenger-deep-theme use-package general evil avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'challenger-deep t)
