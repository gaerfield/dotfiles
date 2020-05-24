# explicitely set XDG-Directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# set zsh-config-home to XDG-Directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1
