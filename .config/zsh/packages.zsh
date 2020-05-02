turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zcommand() { zinit ice wait"0b" lucid as"program" "${@}"; }
zcompletion() { zinit ice lucid as"completion"    "${@}"; }
zload()    { zinit load                           "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }

### Fuzzy Finder fzf

# Install `fzf` bynary and tmux helper script
zcommand from"gh-r";         zload junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zload junegunn/fzf

# Create and bind multiple widgets using fzf
turbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
    zload junegunn/fzf
loadConfig fzf.zsh

### ls - colors

turbo0 atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zload trapd00r/LS_COLORS

### git-extras
#zcommand pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"; zload tj/git-extra

### commands
zcommand from"gh-r" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zload BurntSushi/ripgrep

### more plugins

zinit ice depth=1; zload romkatv/powerlevel10k
zsnippet OMZ::plugins/gradle
zsnippet OMZ::plugins/extract

### this needed to be at last?
# order of loading plugins: https://github.com/zdharma/zinit/issues/130

# zsh-users/zsh-completions: delay compinit
zplugin ice blockf \
atpull'zplg creinstall zsh-users/zsh-completions'
zload zsh-users/zsh-completions

# history-search-multi-word
zplugin ice compile"(hsmw-*|history-*)" #wait'0' lucid
zload zdharma/history-search-multi-word # bindkey "^R" could be overridden by PMZ::editor
bindkey "^R" history-search-multi-word

### autojump with "z"
# the binary
zcommand make"PREFIX=$ZPFX install"; zload clvv/fasd
# initialization from oh-my-zsh
zsnippet OMZ::plugins/fasd
# integration with fzf
zload wookayin/fzf-fasd

zload zdharma/fast-syntax-highlighting
zload zsh-users/zsh-autosuggestions

# unset predefined functions
unset -f turbo0
unset -f turbo1
unset -f turbo2
unset -f zcommand
unset -f zcompletion
unset -f zload
unset -f zsnippet
