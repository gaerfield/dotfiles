zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# fzf-plugins
zplug "junegunn/fzf", \
    as:command, \
    use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:"fzf"

# fast and user-friendly find - dont know yet if its good for me
#zplug "sharkdp/fd", \
#    from:gh-r, \
#    as:command, \
#    use:"*64*linux*", \
#    hook-build:"ls"

# yubikey uses gpg-agent
zplug "plugins/gpg-agent", from:oh-my-zsh

# don't checkout 32M of docker-repos, use oh-my-zsh plugins instead
#zplug "docker/compose", depth:1, use:contrib/completion/zsh
#zplug "docker/cli", depth:1, use:contrib/completion/zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
#zplug "plugins/docker-machine", from:oh-my-zsh
# simple docker ui
zplug "jesseduffield/lazydocker", \
    from:gh-r, \
    use:"*Linux*x86*64*", \
    as:command

#aws
zplug "plugins/aws", from:oh-my-zsh

zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# IDE-like completion from history
zplug "tarruda/zsh-autosuggestions", use:"zsh-autosuggestions.zsh"

zplug 'BurntSushi/ripgrep', \
    from:gh-r, \
    as:command, \
    rename-to:"rg"

# console-snippet-manager - go need 218MB - dpkg-package is available
# zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'
#zplug "knqyf263/pet", \
#    from:gh-r, \
#    use:"*linux*64*tar*", \
#    as:plugin
#zplug "knqyf263/pet", defer:1, \
#    use:"./pet", \
#    as:command
#zplug "knqyf263/pet", defer:2, use:"misc/completions/zsh"

# lnav logfile viewer
zplug "tstack/lnav", \
    from:gh-r, \
    use:"*linux*64*", \
    as:command

# json for commandline
# https://stedolan.github.io/jq/
zplug "stedolan/jq", \
    from:gh-r, \
    use:"*linux64*", \
    as:command

zplug 'liangguohuan/fzf-marker'

zplug "clvv/fasd", as:command, use:fasd
zplug "plugins/fasd", from:oh-my-zsh, if:"(( $+commands[fasd] ))", on:"clvv/fasd"
zplug "wookayin/fzf-fasd"
