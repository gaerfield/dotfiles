(( ${+commands[gh]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_gh"
  [[ -e "$COMPLETIONS" ]] || gh completion -s zsh > "$COMPLETIONS"
}
