;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     ;; (git :variables
     ;;      git-gutter-use-fringe t)
     ;; markdown
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t)
     org
     scala
     racket
     emacs-lisp
     ;; shell rather than eshell, ansi, ...
     ;; https://www.masteringemacs.org/article/running-shells-in-emacs-overview
     (shell :variables
            shell-default-shell 'shell)
     syntax-checking
     ;; osx
     ;; --------------------------------------------------------
     ;; org-setup
     proverif
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(prop-menu
                                      idris-mode
                                      tao-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; Do not print a ~ to indicate the end of file
     vi-tilde-fringe
     ;; Do not show symbol as bullet for headers in org
     org-bullets
     )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         tao)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 0.9)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 97
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 97
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; -- Utils
  (defun string/ends-with (string suffix)
    "Return t if STRING ends with SUFFIX."
    (and (string-match (rx-to-string `(: ,suffix eos) t)
                       string)
         t))

  (defun string/starts-with (string prefix)
    "Return t if STRING starts with prefix."
    (and (string-match (rx-to-string `(: bos ,prefix) t)
                       string)
         t))

  ;; -- Hardware setup
  ;; Are we on a mac?
  (setq is-mac (equal system-type 'darwin))

  ;; Are we using a mac-keyboard
  (setq mac-keyboard t)

  ;; -- Appearance
  (toggle-transparency)

  ;; Powerline
  (setq powerline-default-separator 'arrow)
  (setq powerline-default-separator-dir '(right . right))

  ;; Fringeline
  ;; Display - in the fringe line for EOF
  (setq-default indicate-empty-lines t)
  ;; Set the fringe bitmaps as emacs default values
  (setq-default fringe-indicator-alist
                '((truncation left-arrow right-arrow)
                  (continuation left-curly-arrow right-curly-arrow)
                  (overlay-arrow . right-triangle)
                  (up . up-arrow)
                  (down . down-arrow)
                  (top top-left-angle top-right-angle)
                  (bottom bottom-left-angle
                          bottom-right-angle
                          top-right-angle
                          top-left-angle)
                  (top-bottom left-bracket
                              right-bracket
                              top-right-angle
                              top-left-angle)
                  (empty-line . empty-line)
                  (unknown . question-mark)))

  ;; Line behavior
  (setq-default default-fill-column 70)
  ;; Stop truncate lines
  (add-hook 'text-mode-hook (lambda ()
                              (setq truncate-lines nil)))
  ;; Never insert tabs
  (set-default 'indent-tabs-mode nil)
  ;; Delete trailing whitespace before saving
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; Highlight current line
  (set-face-attribute 'hl-line nil :background "#4A2F59")
  (set-face-attribute 'region nil :background "#6B3654")

  ;; Highlight the following words in comments
  (defun add-watchwords ()
    (font-lock-add-keywords
     nil '(("\\<\\(TODO\\|FIXME\\|HACK\\|XXX\\|BUG\\|Note\\):"
            1 font-lock-warning-face t))))
  (add-hook 'prog-mode-hook #'add-watchwords)
  (add-hook 'org-mode-hook #'add-watchwords)

  ;; -- Modes
  ;; org
  (require 'org)
  ;; Do not auto-indent lines depending on the depth on the node.
  (setq org-startup-indented nil)
  ;; Do not fontify headline
  (setq org-src-fontify-natively t)

  ;; A footnote reference starting with `:margin:' is transformed as a
  ;; \marginpar in LaTeX. The `:margin:' key word is simply deleted in
  ;; other backend.
  (defun org/latex-filter-ref-margin (fnote backend info)
    (if (org-export-derived-backend-p backend 'latex)
        ;; If LaTeX backend
        (cond
         ((string/starts-with fnote "\\footnote{:margin: ")
            (concat "\\marginpar{"
                    (substring fnote (length "\\footnote{:margin: "))))
         ((string/starts-with fnote "\\footnote{:margin:")
          (concat "\\marginpar{"
                  (substring fnote (length "\\footnote{:margin:")))))
        ;; Other backend
      (progn
        (message "fnoteref: %s" fnote)
        (replace-regexp-in-string ":margin: " "" fnote))))

  ;; TODO: Put filter in a org layer, thus org-export-* will be loaded
  ;; and the following forward declaration will not be required
  ;; anymore
  (setq org-export-filter-footnote-reference-functions nil)
  (add-to-list 'org-export-filter-footnote-reference-functions
               'org/latex-filter-ref-margin)

  ;; I generally cite publication with an org-mode link
  ;; `[[file:file.bib::key][key]]' and I want to get this back a
  ;; `\cite' in LaTeX export.
  ;; (defun org/latex-filter-cite (link backend info)
  ;;   "Ensures that 'my way of cite' is properly handled in LaTeX
  ;; export."
  ;;   ;; Ensure that the filter will only be applied when using `latex'
  ;;   (when (org-export-derived-backend-p backend 'latex)
  ;;     (replace-regexp-in-string "\\href{.+\.bib}{\\(.+\\)}"
  ;;                               "\cite{\\1}"
  ;;                               link)))

  ;; (setq org-export-filter-link-functions nil)
  ;; (add-to-list 'org-export-filter-link-functions
  ;;              'org/latex-filter-cite)

  (defun org/latex-filter-cites (final-output backend info)
    "Makes a multiple cite of adjacent cites in LaTeX export"
    ;; http://www.emacswiki.org/emacs/ElispCookbook#toc2
    (when (org-export-derived-backend-p backend 'latex)
      (replace-regexp-in-string
       "\\\\cite{[a-zA-Z0-9+]+}\\(?:[\s\n]*\\\\cite{[a-zA-Z0-9+]+}\\)+"
       (lambda (cites)
         (save-match-data
           (concat "\\\\cite{"
                   (string-join
                    (mapcar (lambda (cite)
                              (replace-regexp-in-string
                               "\\\\cite{\\([a-zA-Z0-9+]+\\)}"
                               "\\1"
                               cite))
                            (split-string cites))
                    ",")
                   "}")))
       final-output)))

  (setq org-export-filter-final-output-functions nil)
  (add-to-list 'org-export-filter-final-output-functions
               'org/latex-filter-cites)

  ;; Agnostic cite hyperlink
  (setq org-bibref-file
        "/Users/rcherr12/prog/emn_perso/phd/thesis/thesis.bib")

  (defun org-cite-open (key)
    "Visit the reference on KEY.
  KEY shoulb be a citation key available in the `org-bibref-file'"
    (let ((path org-bibref-file)
          (arg 'emacs)
          (search key))
      ;; org-open-file is a function defines in org.el. It is used in
      ;; `org-open-at-point' arround line 10548.
      (org-open-file path arg nil search)))

  (defun org-cite-export (key desc format)
    "Create the export version of a cite link."
    (cond
     ((eq format 'latex) (format "\\cite{%s}" key))
     (t (format "[%s]" key))))

  ;; see org-ascii-link and org-latex-link for inspiration
  ;; (defun org-cite-export (cite desc format)
  ;;   "Transcode a CITE object from Org to FORMAT"
  ;;   (let ((raw-link (org-element-property :raw-link cite)))
  ;;     (message "rw %s" raw-link))
  ;;   ""
  ;;   )

  ;; (defun org-cite-store-link ()
  ;;   "Store a link to a citation."
  ;;   (let* ((key (org-cite-get-key))
  ;;          (link (concat "cite:" key))
  ;;          (description (fomat "Citation for %s in %s" key org-bibref-file)))
  ;;     (org-store-link-props
  ;;      :type "cite"
  ;;      :link link
  ;;      :decription description)))

  (org-add-link-type "cite" 'org-cite-open 'org-cite-export)


  ;; (defun org-open-cite (path)
  ;;   (org-open-file path nil nil  ))
  ;; (org-add-link-type "cite" 'org-open-cite)

  ;; LaTeX
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; helm
  (setq helm-recentf-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)

  ;; vc-mode
  ;; Visit symbolic link to a file. This bypass the emacs version
  ;; control system, but I don't use it!
  (setq vc-follow-symlinks nil)

  ;; -- Key bindings
  ;; Mac-os key
  (when mac-keyboard
   (setq x-meta-keysym 'super)
   (setq x-super-keysym 'meta))

  (when is-mac
   (setq mac-option-modifier 'none)
   (setq mac-command-modifier 'meta)
   (setq ns-function-modifier 'hyper))

  ;; Window split
  ;; http://emacswiki.org/emacs/ToggleWindowSplit
  (defun toggle-window-split ()
    (interactive)
    (if (= (count-windows) 2)
        (let* ((this-win-buffer (window-buffer))
               (next-win-buffer (window-buffer (next-window)))
               (this-win-edges (window-edges (selected-window)))
               (next-win-edges (window-edges (next-window)))
               (this-win-2nd (not (and (<= (car this-win-edges)
                                           (car next-win-edges))
                                       (<= (cadr this-win-edges)
                                           (cadr next-win-edges)))))
               (splitter
                (if (= (car this-win-edges)
                       (car (window-edges (next-window))))
                    'split-window-horizontally
                  'split-window-vertically)))
          (delete-other-windows)
          (let ((first-win (selected-window)))
            (funcall splitter)
            (if this-win-2nd (other-window 1))
            (set-window-buffer (selected-window) this-win-buffer)
            (set-window-buffer (next-window) next-win-buffer)
            (select-window first-win)
            (if this-win-2nd (other-window 1))))))

  (evil-leader/set-key "w|" 'toggle-window-split)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values (quote ((org-export-initial-scope quote subtree)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
