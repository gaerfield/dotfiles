zsnippet $ZSH_CONF/additional-completions/_gcloud

export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraform/terraformrc"

zinit id-as'terraform' as'readurl|command' extract \
    dlink0'/terraform/%VERSION%/~%.*-(alpha|beta|rc).*%' \
    dlink'/terraform/%VERSION%/terraform_%VERSION%_linux_amd64.zip' \
    for https://releases.hashicorp.com/terraform/

# this is a hack to add terraform completions (completion-file sadly isn't available)
zplugin ice svn wait'1' atinit'complete -o nospace -C $(which terraform) terraform'
zplugin light zdharma/null
