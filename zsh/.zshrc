# Set up the prompt

autoload -Uz promptinit
promptinit
prompt suse

setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit -d ~/.cache/zsh/.zcompdump

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# history settings
HISTFILE=~/.cache/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob

# File-manager like bindings Alt-Left and Alt-Up
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

# mist settings
unsetopt beep
bindkey -v
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# ctrl-w removed word backwards
bindkey '^w' backward-kill-word
## add vim more indication
function zle-line-init zle-keymap-select {
    VIM_PROMPT="[% NORMAL]% "
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# set vim as default editor
export EDITOR=vim
# ls colors
eval `dircolors ~/.config/gnu/dircolors.ansi-light`
# aliases
alias zshrc='$EDITOR ~/.config/zsh/.zshrc' 
# size,show type,human readable
alias l='ls --color -lFh'
# long list,show almost all,show type,human readable
alias la='ls --color -lAFh --group-directories-first'
# sorted by date,recursive,show type,human readable
alias lr='ls --color -tRFh'
# long list,sorted by date,show type,human readable
alias lt='ls --color -ltFh'
alias grep='grep --color'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias gs="git status"
alias gd="git difftool"
alias dud='du -d 1 -h'
alias duf='du -sh *'
# tmuxinator completions
source ~/.config/zsh/tmuxinator.zsh
# load local configuration
LOCALALIASES=~/.config/local/zsh/aliases.sh
 if [[ -f $LOCALALIASES && -r $LOCALALIASES ]]; then
    source $LOCALALIASES
fi
