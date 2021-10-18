zsnippet $ZSH_CONF/additional-completions/_gcloud

export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraform/terraformrc"

zcommand from"gh-r" \
  atclone"mkdir -p $XDG_CACHE_HOME/terraform/plugin-cache"
zload warrensbox/terraform-switcher
alias tfswitch="tfswitch --bin=$XDG_BIN_HOME/terraform"

