# explicitely set XDG-Directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_LOCAL_HOME=$HOME/.local
export XDG_PREFIX_HOME=$XDG_LOCAL_HOME
export XDG_DATA_HOME=$XDG_LOCAL_HOME/share
export XDG_BIN_HOME=$XDG_LOCAL_HOME/bin

# set zsh-config-home to XDG-Directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
