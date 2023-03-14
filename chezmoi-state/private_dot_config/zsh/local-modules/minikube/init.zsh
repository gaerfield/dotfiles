(( ${+commands[minikube]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_minikube"
  [[ -e "$COMPLETIONS" ]] || minikube completion zsh > "$COMPLETIONS"
}
