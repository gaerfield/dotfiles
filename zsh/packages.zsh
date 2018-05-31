zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
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
zplug "plugins/gpg-agent", \
    from:oh-my-zsh

# don't checkout 32M of docker-repos, use oh-my-zsh plugins instead
#zplug "docker/compose", depth:1, use:contrib/completion/zsh
#zplug "docker/cli", depth:1, use:contrib/completion/zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
#zplug "plugins/docker-machine", from:oh-my-zsh

zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
#zplug "zx2c4/password-store", use:"src/completion/pass.zsh-completion"

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "tarruda/zsh-autosuggestions", use:"dist/autosuggestions.zsh"
