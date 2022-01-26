zcommand \
    pick"$ZPFX/bin/git-*" \
    make"PREFIX=$ZPFX" nocompile \
    atclone"source etc/git-extras-completion.zsh" \
    atpull'%atclone'
zload tj/git-extras

zcommand from"gh-r" pick"*linux*x68*64*"
zload dotzero/git-profile

zload wfxr/forgit

zcommand from"gh-r"; zload jesseduffield/lazygit

zcommand \
  from"gh-r" \
  ver"latest" \
  bpick"*.tar.gz" \
  pick"./*/bin/gh"  \
  atclone"./*/bin/gh completion -s zsh > _gh" \
  atpull'%atclone'
zload cli/cli
