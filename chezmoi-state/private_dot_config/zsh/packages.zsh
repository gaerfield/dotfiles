turbo0()   { zinit ice depth"1" wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice depth"1" wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice depth"1" wait"0c" lucid             "${@}"; }
zcommand() { zinit ice depth"1" wait"0b" lucid as"program" "${@}"; }
zsnippet() { zinit snippet "${@}"; }
zcompletion() { zinit ice depth"1" wait lucid as"completion"; zsnippet "${@}"; }
zload()    { zinit load "${@}"; }

# zplugin pack installs from: https://github.com/Zsh-Packages
arch="$(uname -m)"

# annexes
zinit light zdharma-continuum/zinit-annex-bin-gem-node

case "$OSTYPE" in
  linux*) bpick='*((#s)|/)*(linux|musl)*((#e)|/)*' ;;
  darwin*) bpick='*(macos|darwin)*' ;;
  *) echo 'WARN: unsupported system -- some cli programs might not work' ;;
esac

# fzf

#zinit pack"bgn-binary+keys" for fzf

zinit \
    atclone'mkdir -p $ZPFX/{bin,man/man1}; \
      curl -s https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh > _fzf_completion; \
      curl -s https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh > key-bindings.zsh; \
      curl -s https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf-tmux.1 > $ZPFX/man/man1/fzf-tmux.1; \
      curl -s https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1 > $ZPFX/man/man1/fzf.1' \
    atpull'%atclone' \
    from'gh-r' \
    id-as'junegunn/fzf' \
    lucid \
    nocompile \
    pick'/dev/null' \
    sbin'fzf' \
    src'key-bindings.zsh' \
  for junegunn/fzf

### movement with "z"
# the binary
zcommand make"PREFIX=$ZPFX install" atload'eval "$(fasd --init auto)"'; zload clvv/fasd
# initialization from oh-my-zsh
zsnippet OMZP::fasd
# integration with fzf
zload wookayin/fzf-fasd

### ls - colors

zinit ice depth="1" \
  atclone'(( !${+commands[dircolors]} )) && local P=g; \
    TERM=ansi ${P}dircolors -b src/dir_colors >! colors.zsh' \
  atpull'%atclone' pick"colors.zsh" nocompile'!' reset \
  atload'zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}";'
zload arcticicestudio/nord-dircolors

### plugins

zsnippet OMZP::gradle
zsnippet OMZP::extract
zsnippet OMZP::colored-man-pages

### Binaries

# direnv
zcommand from"gh-r" \
    bpick"*linux*64*" \
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
if [[ $arch = *"x86_64"* ]]; then
  # this is a standard x64 machine
  chezmoiPick="*linux_amd64.tar.gz"
elif [[ $arch = *"arm"* ]]; then
  # a raspi
  chezmoiPick="*linux_arm.tar.gz"
else
  # or fall back to default
  chezmoiPick=""
fi

zcommand from"gh-r" \
    bpick"$chezmoiPick" \
    atclone'./chezmoi completion zsh > _chezmoi' \
    atpull'%atclone'
zload twpayne/chezmoi

unset chezmoiPick

zcommand from"gh-r" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zload BurntSushi/ripgrep

if [[ $arch = *"x86_64"* ]]; then
  # jq only available for x86-arch: https://github.com/stedolan/jq/issues/2275
  zcommand from"gh-r" bpick"*linux64*" mv"jq* -> jq" pick"jq"
  zload stedolan/jq
fi

zcommand from"gh-r" pick"*/pt"
zload monochromegane/the_platinum_searcher

zcommand from"gh-r" mv"yq* -> yq" pick"yq"
zload mikefarah/yq

if [[ $arch = *"x86_64"* ]]; then
  # this is a standard x64 machine
  tldrPick="*linux*x86_64*"
elif [[ $arch = *"arm"* ]]; then
  # a raspi
  tldrPick="*linux*armv7*"
else
  # or fall back to default
  tldrPick=""
fi

zcommand from"gh-r" \
  bpick"$tldrPick" \
  mv"tealdeer* > tldr" \
  atclone"./tldr --seed-config; ./tldr --update" \
  pick"tldr"
zload dbrgn/tealdeer

unset tldrPick

### powershell 10k
loadConfig prompt.zsh

### this needed to be at last?
# order of loading plugins: https://github.com/zdharma-continuum/zinit/issues/130

# zsh-users/zsh-completions: delay compinit
turbo0 blockf atpull'zinit creinstall -q ./src'; zload zsh-users/zsh-completions

#zplugin ice blockf \
#atpull'zplg creinstall zsh-users/zsh-completions'
#zload zsh-users/zsh-completions

# history-search-multi-word
turbo0 compile"(hsmw-*|history-*)"; zload zdharma-continuum/history-search-multi-word
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