# set vim as default editor
export EDITOR=vim
# Use vim cli mode
bindkey -v
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
