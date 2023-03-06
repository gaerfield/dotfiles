(( ${+commands[gcloud]} )) && () {
  local COMPLETIONS="$ZSH_EXTRA_COMPLETIONS_DIR/_gcloud"
  [[ -e "$COMPLETIONS" ]] || ln -s /var/lib/snapd/snap/google-cloud-cli/current/completion.zsh.inc "$COMPLETIONS"
}
