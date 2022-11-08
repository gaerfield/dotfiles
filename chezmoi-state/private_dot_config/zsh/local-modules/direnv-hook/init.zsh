(( ${+commands[direnv]} )) && () {
  local HOOK_LOCATION="$ZSH_CONF/local-modules/direnv-hook/functions"
  local HOOK_FILE="$HOOK_LOCATION/direnv-hook.zsh"
  if [[ ! -e $HOOK_LOCATION ]]; then
    mkdir -p "$HOOK_LOCATION"
    direnv hook zsh > "$HOOK_FILE"
  fi
  source $HOOK_FILE
}