turbo0()   { zinit ice depth"1" wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice depth"1" wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice depth"1" wait"0c" lucid             "${@}"; }
zcommand() { zinit ice depth"1" wait"0b" lucid as"program" "${@}"; }
zsnippet() { zinit snippet "${@}"; }
zcompletion() { zinit ice depth"1" wait lucid as"completion"; zsnippet "${@}"; }
zload()    { zinit load "${@}"; }

# zplugin pack installs from: https://github.com/Zsh-Packages

### Fuzzy Finder fzf
# requires go to be available :(
# zplugin pack"bgn+keys" for fzf

# Install `fzf` bynary and tmux helper script
zcommand from"gh-r";         zload junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zload junegunn/fzf

# Create and bind multiple widgets using fzf
turbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
zload junegunn/fzf

### movement with "z"
# the binary
zcommand make"PREFIX=$ZPFX install" atload'eval "$(fasd --init auto)"'; zload clvv/fasd
# initialization from oh-my-zsh
zsnippet OMZP::fasd
# integration with fzf
zload wookayin/fzf-fasd

### ls - colors
zinit pack for dircolors-material

#zinit ice depth="1" \
#    atclone"dircolors -b src/dir_colors > dircolors.zsh" \
#    atpull'%atclone' pick"dircolors.zsh" nocompile'!' \
#    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
#zload arcticicestudio/nord-dircolors

### plugins

zsnippet OMZP::gradle
zsnippet OMZP::extract
zsnippet OMZP::colored-man-pages

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
if (($PROFILES[(Ie)git-extras])); then
  loadConfig packages-git-extras.zsh
fi

# docker
if (($PROFILES[(Ie)docker])); then
  loadConfig packages-docker.zsh
fi

# kubernetes
if (($PROFILES[(Ie)kubernetes])); then
  loadConfig packages-gcloud.zsh
  loadConfig packages-kubernetes.zsh
fi

# other Binaries

zcommand from"gh-r" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zload BurntSushi/ripgrep

zcommand from"gh-r" bpick"*linux64*" mv"jq* -> jq" pick"jq"
zload stedolan/jq

zcommand from"gh-r" pick"*/pt"
zload monochromegane/the_platinum_searcher

zcommand from"gh-r" mv"yq* -> yq" pick"yq"
zload mikefarah/yq

zcommand from"gh-r" \
  bpick"*x86_64*musl" \
  mv"tldr* > tldr" \
  atclone"./tldr --seed-config; ./tldr --update" \
  pick"tldr"
zload dbrgn/tealdeer

### powershell 10k

zinit ice depth=1 atload'!source $ZSH_CONF/theme.zsh' nocd
zload romkatv/powerlevel10k

### this needed to be at last?
# order of loading plugins: https://github.com/zdharma-continuum/zinit/issues/130

# zsh-users/zsh-completions: delay compinit
turbo0 blockf atpull'zinit creinstall -q ./src'; zload zsh-users/zsh-completions

#zplugin ice blockf \
#atpull'zplg creinstall zsh-users/zsh-completions'
#zload zsh-users/zsh-completions

# history-search-multi-word
turbo1 compile"(hsmw-*|history-*)"; zload zdharma-continuum/history-search-multi-word
bindkey "^R" history-search-multi-word

turbo0 atinit"zicompinit; zicdreplay"; zload zdharma-continuum/fast-syntax-highlighting
turbo0 atload"_zsh_autosuggest_start"; zload zsh-users/zsh-autosuggestions

# unset temporary functions
unset -f turbo0
unset -f turbo1
unset -f turbo2
unset -f zcommand
unset -f zcompletion
unset -f zload
unset -f zsnippet
