set fish_greeting                 # remove greeting on shell startup 

if status is-interactive
    zoxide init fish | source           # load z autojump plugin
    chezmoi completion fish | source    # completions for fish
    
    # tide customization - show right side kubectl/gcloud info only on specific commands
    set -gx tide_show_gcloud_on kubectl helm kubens kubectx stern gcloud
    set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern gcloud

    # fzf directory
    set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
    set fzf_directory_opts --bind "ctrl-x:execute(xdg-open {} &> /dev/tty)"

end
