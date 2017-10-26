# options
unsetopt beep
setopt extendedglob
# Set up the prompt
autoload -Uz promptinit
promptinit
prompt suse
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
source ~/.config/zsh/fzf.sh
source ~/.config/zsh/fzf_git.sh
source ~/.config/zsh/fzf_tmux.sh
# interactive cd: ttps://github.com/changyuheng/zsh-interactive-cd
source ~/.config/zsh/zsh-interactive-cd.plugin.zsh
# common aliases
source ~/.config/zsh/aliases.sh
# load local configuration
LOCALALIASES=~/.config/local/zsh/aliases.sh
if [[ -f $LOCALALIASES && -r $LOCALALIASES ]]; then
    source $LOCALALIASES
fi
