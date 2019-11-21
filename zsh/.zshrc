# options
unsetopt beep
setopt extendedglob
# Set up the prompt
export PS1="%F{11}%n%f@%B%m%b:%F{4}%(4~|%-1~../%1~|%~)%f >"
# history settings
HISTFILE=~/.cache/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
# configure completions
source ~/.config/zsh/completions.sh
# ls colors
eval `dircolors ~/.config/gnu/dircolors.ansi-light`
# alt-arrow navigation
source ~/.config/zsh/alt_array_navigation.sh
# vim-line editing
source ~/.config/zsh/vim_mode.sh
# fzf integration
# use silversearcher as default search command
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.ignore -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --path-to-ignore ~/.ignore -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/zsh/fzf.sh
# interactive cd: https://github.com/changyuheng/zsh-interactive-cd
source ~/.config/zsh/zsh-interactive-cd.plugin.zsh
# common aliases
source ~/.config/zsh/aliases.sh
# load local configuration
LOCALALIASES=~/.config/local/zsh/aliases.sh
if [[ -f $LOCALALIASES && -r $LOCALALIASES ]]; then
    source $LOCALALIASES
fi
