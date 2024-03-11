if type -q tfenv
  set -x TFENV_CONFIG_DIR "$XDG_DATA_HOME/tfenv"
end

if type -q kubectl
  set -x KUBECONFIG $XDG_CONFIG_HOME/kube/config
  abbr --add k kubectl
  abbr --add krestart kubectl rollout restart deployment
  if status is-interactive
    kubectl completion fish | source
  end
end

if type -q gcloud
  set -x USE_GKE_GCLOUD_AUTH_PLUGIN True
  if status is-interactive
    # tide customization - show right side kubectl/gcloud info only on specific commands
    set -gx tide_show_gcloud_on kubectl helm kubens kubectx stern gcloud gcx k kcx kns
  end
  abbr --add gcx --set-cursor "gcloud config configurations activate payfree-%"
end 

if type -q kubectx
  abbr --add kcx kubectx
  if status is-interactive
    # tide customization - show right side kubectl/gcloud info only on specific commands
    set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern gcloud gcx kcx kns
  end
end

if type -q kubens
  abbr --add kns kubens
end

