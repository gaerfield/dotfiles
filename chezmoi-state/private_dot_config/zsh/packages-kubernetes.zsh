export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"

# kubectl
: "${K8S_VERSION:=$(curl --silent https://storage.googleapis.com/kubernetes-release/release/stable.txt)}"
# source <($XDG_BIN_HOME/kubectl completion zsh) <- sourcing not working yet
zplugin ice pick"/dev/null" \
  mv"*kubectl -> $XDG_BIN_HOME" \
  atclone'chmod +x $XDG_BIN_HOME/kubectl; $XDG_BIN_HOME/kubectl completion zsh > _kubectl' \
  atpull'%atclone'
zplugin snippet https://storage.googleapis.com/kubernetes-release/release/"$K8S_VERSION"/bin/linux/amd64/kubectl

# kubectx
zcommand from"gh-r" bpick"kubectx*linux_x86_64*"; zload ahmetb/kubectx
# zsnippet $ZSH_CONF/additional-completions/_kubectx

# kubens
zcommand from"gh-r" bpick"kubens*linux_x86_64*" id-as"ahmetb/kubens"; zload ahmetb/kubectx
# zsnippet $ZSH_CONF/additional-completions/_kubens

# k9s
zcommand from"gh-r" bpick"*inux_x86_64*"; zload derailed/k9s

# jsonnet and jsonnet-bundler
#zcommand from"gh-r" mv"tk* -> tk"; zload grafana/tanka
zcommand from"gh-r"; zload google/go-jsonnet
zcommand from"gh-r" mv"jb* -> jb"; zload jsonnet-bundler/jsonnet-bundler

# curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# source <(kubectl completion zsh)
zsnippet $ZSH_CONF/additional-completions/_minikube
#zcompletion https://raw.githubusercontent.com/bonnefoa/kubectl-fzf/master/kubectl_fzf.plugin.zsh

# istio
#: "${ISTIO_VERSION:=$(curl --silent "https://api.github.com/repos/istio/istio/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')}"
zcommand from"gh-r" bpick"istio-*linux*amd64*" \
  ver"$ISTIO_VERSION" \
  pick"*/bin/istioctl" \
  atclone"*/bin/istioctl completion zsh > _istioctl" \
  atpull'%atclone'
zload istio/istio