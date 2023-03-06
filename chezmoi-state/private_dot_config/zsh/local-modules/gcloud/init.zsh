(( ${+commands[gcloud]} )) && () {
  # gcloud uses non-standard completions: manually source it instead of adding it to fpath
  # https://github.com/zimfw/zimfw/discussions/475
  source /opt/google-cloud-sdk/completion.zsh.inc
}
