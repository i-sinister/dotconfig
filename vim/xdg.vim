if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = expand('$HOME/.cache')
endif
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = expand('$HOME/.config')
endif
let $VIM_CFG = expand("$XDG_CONFIG_HOME/vim")
let $VIM_VAR = expand("$XDG_CACHE_HOME/vim")
" viminfo
set viminfo+=n$VIM_VAR/viminfo
" runtimepath
set runtimepath-=~/.vim
set runtimepath^=$VIM_CFG
set runtimepath-=~/.vim/after
set runtimepath+=$VIM_CFG/after
source $VIM_CFG/vimrc
