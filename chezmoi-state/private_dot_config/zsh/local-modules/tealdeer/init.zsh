(( ${+commands[tealdeer]} )) && () {
  local TLDR_CACHE=$XDG_CACHE_HOME/tealdeer
  if [[ ! -e $TLDR_CACHE ]]; then
    tealdeer --seed-config
    tealdeer --update
  fi
  alias tldr='tealdeer'

  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_tealdeer"
  if [[ ! -e $COMPLETIONS ]]; then
    TEALDEER_VERSION=$(tealdeer --version | sed 's/tealdeer //')
    curl --silent --location "https://github.com/dbrgn/tealdeer/releases/download/v$TEALDEER_VERSION/completions_zsh" -o $COMPLETIONS
  fi
}