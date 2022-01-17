setopt COMPLETE_ALIASES

alias opn="xdg-open"
alias cpr="rsync -ah --inplace --no-whole-file --info=progress2"
alias ls='ls --color'
alias l='ls -tF'     # type, info
alias la='ls -tFA'   # type, info, all
alias ll='ls -ltFAh' # long list, type, info, all human readable
alias xclip='xclip -selection c'
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias grep='grep --color'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias gpg='gpg2'

update() {
  . /etc/os-release
  if [ $ID = 'manjaro' ]; then
    # update, remove orphaned packages, clean keeping max 3 old versions, firmware update
    # https://wiki.manjaro.org/index.php/Pamac
    sudo -- sh -c 'pamac update -a && pamac remove -o && pamac clean --keep 3 && fwupdmgr update'
  elif [ $ID = 'debian' ] || [ $ID = 'ubuntu' ]; then
    sudo -- sh -c 'apt update && apt dist-upgrade -y && apt autoremove -y && fwupdmgr update'
  fi
  yadm submodule update --init --recursive
  zinit update --all --parallel
}
alias port='netstat -tulpn | grep'

alias python='python3'

alias tb='nc termbin.com 9999'

# docker
alias dco='docker-compose'
alias dcl='docker-compose logs -f'
alias dcu='docker-compose up && docker-compose logs -f'
alias dcd='docker-compose down'

# fpt - to dangerous!
# alias fpt='pt "" * | fzf'
#alias fpt='pt "" * | fzf --preview "(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200"'
alias ide='launch idea $@'

# stream json-logs
jlog() { jq -R '. as $line | try fromjson catch $line' }
#alias -g jlog='jq -R '. as $line | try fromjson catch $line''

launch() {
  if [[ $1 == "" || $1 == "-h" || $1 == "--help" ]]; then
    echo 'usage: launch program -with -arguments'
  else
    echo "nohup $@ >/dev/null 2>&1 &"
    nohup $@ >/dev/null 2>&1 &
  fi
}

# Functions
# simple string-compare
str_cmp() { if [ "$1" = "$2" ]; then echo 0; else echo 1; fi }
# fif <searchTerm> - find in files <searchTerm>
# ---------------------------
fif() {
  local FZF_CTRL_T_COMMAND="rg --files-with-matches --no-messages '$1'"
  local FZF_CTRL_T_OPTS="--preview \"highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 || rg --ignore-case --pretty --context 10 $1 {}\""
  __fsel
}