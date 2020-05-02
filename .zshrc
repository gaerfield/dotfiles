#export TERM="xterm-256color"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZPLUG_LOADFILE="$ZSH_CONF/packages.zsh"

function sourceFile () { [[ ! -f "$1" ]] || source "$1" }
function loadConfig () { sourceFile "$ZSH_CONF/$1" }

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#source ~/.fonts/*.sh
# zinit
source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugin-configuration needed to load at first
loadConfig packages.zsh
# Wort vor- und zurück springen
loadConfig keybindings.zsh
# Alias
loadConfig "alias.zsh"
# Auto-Completion
loadConfig completions.zsh
# History-Einstellungen etc.
loadConfig options.zsh
# autosuggestions
#loadConfig fzf-marker.zsh

sourceFile "$HOME/.zlocal"

unset -f sourceFile
unset -f loadConfig
