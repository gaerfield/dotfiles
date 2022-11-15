(( ${+commands[aqua]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_aqua"
  [[ -e "$COMPLETIONS" ]] || aqua completion zsh > "$COMPLETIONS"
}