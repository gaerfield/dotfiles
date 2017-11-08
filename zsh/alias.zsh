setopt COMPLETE_ALIASES

alias ls='ls --color'
alias l='ls -tF'     # type, info
alias la='ls -tFA'   # type, info, all
alias ll='ls -ltFAh' # long list, type, info, all human readable
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias grep='grep --color'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias update='sudo apt-get update && sudo apt-get upgrade -y && sudo aptitude dist-upgrade -y && sudo apt-get autoremove -y'
alias port='netstat -tulpn | grep'

# Functions
# Find in all files pattern $1
fif() { ff * -exec grep -nHr "$1" {} \; ; }
