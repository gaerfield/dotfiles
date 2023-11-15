set -x TFENV_CONFIG_DIR "$XDG_DATA_HOME/tfenv"
set -x KUBECONFIG $XDG_CONFIG_HOME/kube/config
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True

abbr --add k kubectl
abbr --add krestart kubectl rollout restart deployment
abbr --add kctx kubectx
abbr --add kns kubens

abbr --add gcloud-ctx --set-cursor "gcloud config configurations activate payfree-%"

if status is-interactive
    # tide customization - show right side kubectl/gcloud info only on specific commands
    set -gx tide_show_gcloud_on kubectl helm kubens kubectx stern gcloud
    set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern gcloud
end
