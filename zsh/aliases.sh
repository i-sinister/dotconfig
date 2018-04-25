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
# silver_searcher
alias ag='ag --path-to-ignore ~/.ignore'
