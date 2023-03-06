(( ${+commands[git-extras]} )) && () {
  # git-extras uses non-standard completions: manually source it instead of adding it to fpath
  # https://github.com/zimfw/zimfw/discussions/475
  source /usr/share/doc/git-extras/git-extras-completion.zsh
}