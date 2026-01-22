# Command line shortcuts

# ls
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -lh'     #long list
alias lla='ls -lha'
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias t='tail -f'
alias he='head'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias f='find'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'

alias so='sort'
alias sonr='sort -nr'
alias rrf='rm -rf'

alias p='ps -f'
alias pef='ps -ef'

alias c='cat'
alias cs='pygmentize -g'  # cat with syntax highlighting
alias csn='pygmentize -g -O style=colorful,linenos=1'

alias v='vim'
alias nv='nvim'


# output redirect: head, tail, /dev/null
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias -g P="2>&1| pygmentize -l pytb"
