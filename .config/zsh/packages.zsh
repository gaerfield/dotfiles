turbo0()   { zinit ice depth"1" wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice depth"1" wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice depth"1" wait"0c" lucid             "${@}"; }
zcommand() { zinit ice depth"1" wait"0b" lucid as"program" "${@}"; }
zsnippet() { zinit snippet "${@}"; }
zcompletion() { zinit ice depth"1" wait lucid as"completion"; zsnippet "${@}"; }
zload()    { zinit load "${@}"; }

### Fuzzy Finder fzf

# Install `fzf` bynary and tmux helper script
zcommand from"gh-r";         zload junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zload junegunn/fzf

# Create and bind multiple widgets using fzf
turbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
zload junegunn/fzf

### movement with "z"
# the binary
zcommand make"PREFIX=$ZPFX install"; zload clvv/fasd
# initialization from oh-my-zsh
zsnippet OMZ::plugins/fasd
# integration with fzf
zload wookayin/fzf-fasd

### ls - colors

zinit ice depth="1" \
    atclone"dircolors -b src/dir_colors > dircolors.zsh" \
    atpull'%atclone' pick"dircolors.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zload arcticicestudio/nord-dircolors

### plugins

zsnippet OMZ::plugins/gradle
zsnippet OMZ::plugins/extract

### completions

zcompletion https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
zcompletion https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

zcompletion $ZSH_CONF/additional-completions/_kubectl
zcompletion $ZSH_CONF/additional-completions/_minikube
zcompletion https://raw.githubusercontent.com/bonnefoa/kubectl-fzf/master/kubectl_fzf.plugin.zsh

### Binaries

# direnv

zcommand from"gh-r" \
    mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' \
    pick"direnv" \
    src="zhook.zsh"
zload direnv/direnv

# git-extras
#
if (($PROFILES[(Ie)git-extras])); then
  # git-extras
  zcommand \
      pick"$ZPFX/bin/git-*" \
      make"PREFIX=$ZPFX" nocompile \
      atclone"source etc/git-extras-completion.zsh" \
      atpull'%atclone'
  zload tj/git-extras

  zcommand from"gh-r" pick"*linux*x68*64*"
  zload dotzero/git-profile
fi

# docker

if (($PROFILES[(Ie)docker])); then
  # lazydocker
  zcommand from"gh-r" bpick"*Linux*x86*64*"
  zload jesseduffield/lazydocker
fi

# kubernetes

if (($PROFILES[(Ie)kubernetes])); then
  zcommand from"gh-r" bpick"istio-*linux*amd64*" \
    ver"1.9.1" \
    pick"*/bin/istioctl" \
    atclone"source istio*/tools/_istioctl"
  zload istio/istio

  zcommand from"gh-r"; zload derailed/k9s

  zcommand from"gh-r" bpick"kubectx*"; zload ahmetb/kubectx
  zcommand from"gh-r" bpick"kubens*" id-as"ahmetb/kubens" ; zload ahmetb/kubectx

  zcompletion /usr/share/google-cloud-sdk/completion.zsh.inc
fi

# other Binaries

zcommand from"gh-r" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zload BurntSushi/ripgrep

zcommand from"gh-r" bpick"*linux64*" mv"jq* -> jq" pick"jq"
zload stedolan/jq

zcommand from"gh-r" pick"*/pt"
zload monochromegane/the_platinum_searcher

zcommand from"gh-r" bpick"*.tar.gz" mv"yq* -> yq" pick"yq"
zload mikefarah/yq

### powershell 10k

zinit ice depth=1 atload'!source $ZSH_CONF/theme.zsh' nocd
zload romkatv/powerlevel10k

### this needed to be at last?
# order of loading plugins: https://github.com/zdharma/zinit/issues/130

# zsh-users/zsh-completions: delay compinit
turbo0 blockf atpull'zinit creinstall -q .'; zload zsh-users/zsh-completions

#zplugin ice blockf \
#atpull'zplg creinstall zsh-users/zsh-completions'
#zload zsh-users/zsh-completions

# history-search-multi-word
turbo1 compile"(hsmw-*|history-*)"; zload zdharma/history-search-multi-word
bindkey "^R" history-search-multi-word

turbo0 atinit"zicompinit; zicdreplay"; zload zdharma/fast-syntax-highlighting
turbo0 atload"_zsh_autosuggest_start"; zload zsh-users/zsh-autosuggestions

# unset temporary functions
unset -f turbo0
unset -f turbo1
unset -f turbo2
unset -f zcommand
unset -f zcompletion
unset -f zload
unset -f zsnippet
