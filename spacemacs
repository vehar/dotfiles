;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '(
    "~/dotfiles/spacemacs-layers/"
    )
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     emacs-lisp
     evil-commentary
     fullscreen-transparency
     git
     github
     go
     java
     (latex :variables
            latex-build-command "xelatex")
     markdown
     org
     python
     rust
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term)
     spell-checking
     ;; Lots of trouble with the semantic package.  Disabled for now.
     ;; semantic
     syntax-checking
     version-control
     vim-empty-lines
     vinegar
     (whitespace :variables
                 whitespace-global-butler t
                 whitespace-global-detect-indent t
                 whitespace-global-show t)
     xkcd
     yaml
     ycmd
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
     pulse
   )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
     evil-escape
   )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(material material-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata-g for Powerline"
                               :size 18
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.5
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
   It is called immediately after `dotspacemacs/init'.  You are free to put any
   user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
   This function is called at the very end of Spacemacs initialization after
   layers configuration. You are free to put any user code."
  ;; Various options
  (setq-default frame-resize-pixelwise t
                window-resize-pixelwise t
                undo-tree-auto-save-history t
                mouse-autoselect-window t
                sentence-end-double-space nil
                tab-width 4
                whitespace-style '(trailing tabs newline tab-mark space-before-tab)
                ;; Allow cursor closer to the bottom of the window than
                ;; Spacemacs default... Smooth-scroll seems to be in use, but only
                ;; scroll-margin has any effect.
                smooth-scroll-margin 4
                scroll-margin 4
                )
  ;; Various extra leader bindings
  (evil-leader/set-key
    "bc" 'spacemacs/new-empty-buffer
    "br" 'rename-buffer
    "wo" 'delete-other-windows
    "ha" 'apropos
    "hs" 'helm-spacemacs
    "hw" 'where-is
    ;; helm-make is on 'SPC h k' by default but I don't use it much yet.
    "hk" 'describe-key
    "hK" 'helm-make
    "q RET" 'evil-quit
    )

  ;; I would prefer that the options for "ws" and "wS" be reversed
  (evil-leader/set-key "ws" 'split-window-below-and-focus
    "wS" 'split-window-below
    "wv" 'split-window-right-and-focus
    "wV" 'split-window-right)

  (defun ycmd-restart ()
    "Restarts YouCompleteMe by stopping and starting it."
    (interactive)
    (ycmd-close)
    (ycmd-open))
  ;;(add-hook 'c-mode-hook 'ycmd-mode)
  (bind-key "C-SPC" #'company-complete evil-insert-state-map)
  (setq-default ycmd-force-semantic-completion t
                ycmd-extra-conf-handler 'load
                ycmd-request-message-level -1)
  (global-ycmd-mode)
  ;; Set the path to find racer and ycmd
  (setq exec-path (append exec-path '("~/bin"))
        ycmd-server-command `("python2" ,(expand-file-name "~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd")))
  ;; Line numbers everywhere (linum-relative-mode enables global-linum-mode)
  (linum-relative-mode)
  ;; ...except on Spacemacs home page.  It is already loaded when this function runs, so disable it there too.
  (add-hook 'spacemacs-mode-hook (lambda () (linum-mode -1)))
  (with-current-buffer "*spacemacs*" (linum-mode -1))
  ;; Disable relative mode in INSERT state, and re-enable when leaving it.  Also make its format match that
  ;; of the default linum-mode.
  (add-hook 'evil-insert-state-entry-hook 'linum-relative-off)
  (add-hook 'evil-insert-state-exit-hook 'linum-relative-on)
  (setq linum-relative-format "%4s")
  ;; Draw tabs in comment face, and keywords in warning face
  (defun add-georgev-highlights ()
    "Adds several highlights, such as tabs and TODOs, that I like."
    (unless (eq major-mode 'org-mode)
      (font-lock-add-keywords nil '(
        ("\t" . 'font-lock-comment-face)
        ("\\<TODO\\>" 0 'font-lock-warning-face prepend)
        ("\\<HACK\\>" 0 'font-lock-warning-face prepend)
        ("\\<FIXME\\>" 0 'font-lock-warning-face prepend)))))
  (add-hook 'prog-mode-hook 'add-georgev-highlights)
  ;; Pulse the current line after a search
  (require 'pulse)
  (defun pulse-current-line (&rest _ignored)
    "Pulses the line at point. Probably only useful as a hook target."
    (interactive)
    (pulse-momentary-highlight-one-line (point)))
  (setq pulse-delay 0
        pulse-iterations 6)
  (mapc (lambda (f) (advice-add f :after 'pulse-current-line))
        '(isearch-forward isearch-backward evil-search-previous evil-search-next ahs-forward ahs-backward))
  )

(setq local-spacemacs-config "~/.spacemacs_local")
(when (file-exists-p local-spacemacs-config)
  (advice-add 'dotspacemacs/user-config :after (lambda () (load-file local-spacemacs-config))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
