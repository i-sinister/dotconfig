fzfhelp() {
  cat << 'EOF'
Fzf key bindings:
  CTRL-T - Paste the selected file path(s) into the command line
  CTRL-R - Paste the selected command from history into the command line
  ALT-C  - cd into the selected directory
  CTRL-I - trigger fzf-completion

Custom functions:
  cdf   - cd to selected directory
  csf   - cd to subdirectory
  cdpf  - cd to selected parent directory
  cdfd  - cd to directory of selected file
  cf    - fuzzy cd from anywhere
  fe    - open selected file in editor
  fo    - open or edit selected file
  vf    - fuzzy open with vim anywhere
  vf    - fuzzy grep via ag
  fkill - kill process

Git functions:
  fbr    - checkout git branch
  fbr    - checkout git branch (including remote branches)
  fbr    - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
  fco    - checkout git branch/tag
  fcoc   - checkout git commit
  fshow  - git commit browser
  fcs    - get git commit sha; example usage: git rebase -i `fcs`
  fstash - easier way to deal with stashes
    type fstash to get a list of your stashes
    enter shows you the contents of the stash
    ctrl-d shows a diff of the stash against your current HEAD
    ctrl-b checks the stash out as a branch, for easier merging

Tmux functions:
  tm     - create new tmux session, or switch to existing one:
    * `tm` will allow you to select your tmux session via fzf.
    * `tm irc` will attach to the irc session (if it exists), else it will create it.
  fs [FUZZY PATTERN] - select selected tmux session
  ftpane - switch pane
EOF
}

source ~/.config/zsh/fzf/file_operations.zsh
source ~/.config/zsh/fzf/git.zsh
source ~/.config/zsh/fzf/tmux.zsh
