;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map! "C-z" nil)
(setq doom-localleader-alt-key "C-z")

(map!
 ;;"M-n"           #'down-scroll
 ;;"M-p"           #'up-scroll
 ;;"M-d"           #'delete-word
 "<M-backspace>" #'backward-delete-word
 "<C-backspace>" #'backward-delete-word
 "C-k"           #'kill-line
 "C-M-q"         #'unfill-paragraph
 "S-<f1>"        #'macro-on
 "<f1>"          #'call-last-kbd-macro
 "C-c p p"       #'projectile-switch-project
 "M-o"           #'ace-window
 "C-x t"         #' treemacs
 ;; Magit
 "C-x g"         #' magit-status
 ;; Editor related bindings
 [remap newline] #'newline-and-indent
 "C-j"           #'+default/newline
  ;; Resize window
 "S-C-<left>"    #'shrink-window-horizontally
 "S-C-<right>"   #'enlarge-window-horizontally
 "S-C-<down>"    #'shrink-window
 "S-C-<up>"      #'enlarge-window
 ;; Buffer related bindings
 "S-<left>"      #'+boy/window-move-left
 "S-<right>"     #'+boy/window-move-right
 "S-<up>"        #'+boy/window-move-up
 "S-<down>"      #'+boy/window-move-down
 "C-s-<left>"    #'+boy/window-move-far-left
 "C-s-<right>"   #'+boy/window-move-far-right
 "C-s-<up>"      #'+boy/window-move-very-top
 "C-s-<down>"    #'+boy/window-move-very-bottom
 ;; Switching windows
 "C-x C-o"       #'+boy/switch-to-last-window



 (:leader
   (:prefix-map ("f" . "file")
     :desc "Move this file"   "m" #'doom/move-this-file
     :desc "New empty buffer" "n" #'new-buffer
     :desc "Kill all buffers" "K" #'doom/kill-all-buffers)
   (:prefix-map ("w" . "workspaces/windows")
     :desc "Resize window"           "h" #'resize-window) ; requires private package 'resize-window'
   ;; Org related bindings
   (:prefix-map ("o". "org")
     :desc "Do what I mean"          "o" #'+org/dwim-at-point
     :desc "Org hydra"               "h" #'org-babel-hydra/body
     :desc "Display inline images"   "i" #'org-display-inline-images)
   ;; Snippets
   (:prefix-map ("&" . "snippets")
     :desc "Find snippet"          "s" #'+default/find-in-snippets
     :desc "Find snippet for mode" "S" #'+default/browse-snippets)
   ;; Terminal
   (:prefix-map ("t" . "terminal")
     "t"  #'+eshell/toggle
     "T"  #'+eshell/here)
   ;; Lookup
   (:when (featurep! :tools lookup)
     (:prefix-map ("g" . "lookup")
       "k" #'+lookup/documentation
       "d" #'+lookup/definition
       "D" #'+lookup/references
       "f" #'+lookup/file
       "o" #'+lookup/online-select
       "i" #'+lookup/in-docsets
       "I" #'+lookup/in-all-docsets)))
)
