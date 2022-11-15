(( ${+commands[kubectl]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_kubectl"
  [[ -e "$COMPLETIONS" ]] || kubectl completion zsh > "$COMPLETIONS"
}

# curl -sSfL = curl --silent --show-error --fail --location (follow-redirects)

(( ${+commands[kubectx]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_kubectx"
  [[ -e "$COMPLETIONS" ]] || curl -sSfL "https://raw.githubusercontent.com/ahmetb/kubectx/v$(kubens --version)/completion/kubectx.zsh" > "$COMPLETIONS"
}

(( ${+commands[kubens]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_kubens"
  [[ -e "$COMPLETIONS" ]] || curl -sSfL "https://raw.githubusercontent.com/ahmetb/kubectx/v$(kubens --version)/completion/kubens.zsh" > "$COMPLETIONS"
}

(( ${+commands[istioctl]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_istioctl"
  [[ -e "$COMPLETIONS" ]] || istioctl completion zsh > "$COMPLETIONS"
}
