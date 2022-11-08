# fix preview on descriptions in fzf-tab (and break probably something other)
# because of this bug these config must be loaded last to overwrite the troubling config
# introduced by some other plugin
# https://github.com/Aloxaf/fzf-tab/issues/234
zstyle -d ':completion:*' format
zstyle ':completion:*:descriptions' format '[%d]'