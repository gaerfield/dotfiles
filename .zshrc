#export TERM="xterm-256color"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZPLUG_CACHE_DIR="$ZSH_CACHE_DIR/zplug"
export ZTHEME_CACHE_DIR="$ZSH_CACHE_DIR/theme"
export ZPLUG="$HOME/.zplug"
export ZPLUG_LOADFILE="$ZSH_CONF/packages.zsh"

function sourceFile () { [[ ! -f "$1" ]] || source "$1" }
function loadConfig () { sourceFile "$ZSH_CONF/$1" }
function assertDirectory () { [[ ! -d "$1" ]] || mkdir -p "$1" }

assertDirectory "$ZPLUG_CACHE_DIR"
assertDirectory "$ZTHEME_CACHE_DIR"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$ZTHEME_CACHE_DIR/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$ZTHEME_CACHE_DIR/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# should speed up parsing git-repos
# does it help?
DISABLE_UNTRACKED_FILES_DIRTY="true"

#source ~/.fonts/*.sh
# zplug
source $ZPLUG/init.zsh

if ! zplug check; then
    zplug install
fi

# use --verbose to list loaded plugins
zplug load #--verbose

# powerlevel10k-Konfiguration
loadConfig theme.zsh
# Wort vor- und zurück springen
loadConfig keybindings.zsh
# Alias
loadConfig "alias.zsh"
# Auto-Completion
loadConfig completions.zsh
# History-Einstellungen etc.
loadConfig options.zsh
# fuzzy-search/completions etc.
loadConfig fzf.zsh
# autosuggestions
loadConfig autosuggestions.zsh
loadConfig fzf-marker.zsh

sourceFile "$HOME/.zlocal"

[[ ! -f "$ZSH_CONF/dircolors" ]] || eval `dircolors $ZSH_CONF/dircolors`

