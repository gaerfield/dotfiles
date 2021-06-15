zsnippet OMZ::plugins/gradle

# direnv

zcommand from"gh-r" \
    mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' \
    pick"direnv" \
    src="zhook.zsh"
zload direnv/direnv

# git-extras
zcommand \
    pick"$ZPFX/bin/git-*" \
    make"PREFIX=$ZPFX" nocompile \
    atclone"source etc/git-extras-completion.zsh" \
    atpull'%atclone'
zload tj/git-extras

zcommand from"gh-r" pick"*linux*x68*64*"
zload dotzero/git-profile

# sdkman
