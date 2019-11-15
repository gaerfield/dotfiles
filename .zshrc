#
# User configuration sourced by interactive shells
#

#export TERM="xterm-256color"
export ZSH_CONF="$HOME/.config/zsh"
export ZPLUG="$HOME/.zplug"

#source ~/.fonts/*.sh
# zplug
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
    mkdir -p "$ZSH_CACHE_DIR"
fi

export ZSH_CACHE_DIR="$HOME/.cache/zsh"
export ZPLUG_LOADFILE="$ZSH_CONF/packages.zsh"
source $ZPLUG/init.zsh

if ! zplug check; then
    zplug install
fi

# use --verbose to list loaded plugins
zplug load #--verbose

# powerlevel9k-Konfiguration
source $ZSH_CONF/theme.zsh
# Wort vor- und zurück springen
source $ZSH_CONF/keybindings.zsh
# Alias
source $ZSH_CONF/alias.zsh
# Auto-Completion
source $ZSH_CONF/completions.zsh
# History-Einstellungen etc.
source $ZSH_CONF/options.zsh
# fuzzy-search/completions etc.
source $ZSH_CONF/fzf.zsh
# autosuggestions
source $ZSH_CONF/autosuggestions.zsh
source $ZSH_CONF/fzf-marker.zsh

if [[ -s "$HOME/.zlocal" ]]; then
  source "$HOME/.zlocal"
fi

 if [[ -s "$HOME/.dir_colors/dircolors" ]]; then
  eval `dircolors $HOME/.dir_colors/dircolors`
fi


