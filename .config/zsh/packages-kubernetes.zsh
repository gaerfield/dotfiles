# kubectx
zcommand from"gh-r" bpick"kubectx*"; zload ahmetb/kubectx
# zsnippet $ZSH_CONF/additional-completions/_kubectx
# kubens
zcommand from"gh-r" bpick"kubens*" id-as"ahmetb/kubens" ; zload ahmetb/kubectx
# zsnippet $ZSH_CONF/additional-completions/_kubens
# k9s
zcommand from"gh-r"; zload derailed/k9s

# curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# source <(kubectl completion zsh)
zsnippet $ZSH_CONF/additional-completions/_kubectl
zsnippet $ZSH_CONF/additional-completions/_minikube
#zcompletion https://raw.githubusercontent.com/bonnefoa/kubectl-fzf/master/kubectl_fzf.plugin.zsh

zcommand from"gh-r" bpick"istio-*linux*amd64*" \
  ver"1.10.1" \
  pick"*/bin/istioctl" \
  atclone"source istio*/tools/_istioctl"
zload istio/istio
