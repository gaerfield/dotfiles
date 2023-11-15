set -x KUBECONFIG $XDG_CONFIG_HOME/kube/config
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True
if status is-interactive
    # tide customization - show right side kubectl/gcloud info only on specific commands
    set -gx tide_show_gcloud_on kubectl helm kubens kubectx stern gcloud
    set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern gcloud
end