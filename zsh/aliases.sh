# aliases
alias zshrc='$EDITOR ~/.config/zsh/.zshrc'

# ls
# size,show type,human readable
alias l='ls --color -lFh'
# long list,show almost all,show type,human readable
alias la='ls --color -lAFh --group-directories-first'
# sorted by date,recursive,show type,human readable
alias lr='ls --color -tRFh'
# long list,sorted by date,show type,human readable
alias lt='ls --color -ltFh'

#grep
alias grep='grep --color'

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# git
alias gs="git status"
alias gd="git difftool"

# du
alias dud='du -d 1 -h'
alias duf='du -sh *'

# silver_searcher
alias ag='ag --path-to-ignore ~/.ignore'

# taskwarrior
# initialize task repo in current folder
alias task_init_here='echo '"'"'data.location=tasks'"'"' > .taskrc; mkdir ./tasks;'
alias taskl='task rc:.taskrc'
