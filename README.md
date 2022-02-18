# dotfiles

This Repository contains my dotfile-configurations managed by:

* [chezmoi](https://www.chezmoi.io) to version the dotfiles
* [zinit](https://github.com/zdharma-continuum/zinit) to manage my zsh-config and main console-tools as plugins
* and [vim-plug](https://github.com/junegunn/vim-plug) to customize my [neovim](https://neovim.io/)-installation

## daily operations

* chezmoi: [install and daily operations](https://www.chezmoi.io/user-guide/daily-operations/)
  ```bash
  # install
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply gaerfield
  # update
  chezmoi update
  # pull latest changes and see diff
  chezmoi git pull -- --rebase && chezmoi diff
  # only install dotfiles without management
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --one-shot gaerfield
  ```
* zinit: `zinit update -p`
* nvim:
  * Installation: `nvim +silent +PlugInstall +qa`
  * Update:`nvim +silent +PlugUpdate +PlugUpgrade +qa`

## pre-requirements

```
sudo apt install nvim jq
mkdir -p ~/.cache/nvim/{backup,swap,undo,view}
```

## post-install steps

* create file `$HOME/.zprofile` to enable sets of "expensive" plugins (these are evaluated in `$HOME/.config/zsh/packages.zsh`):

  ```
  # desktop
  export PROFILES=(git-extras kubernetes docker)
  ```

* create file `$HOME/.zlocal` for configurations valid only on current host, i.e.:

  ```
  export PATH=~/.local/bin:$PATH
  DEFAULT_USER=gaerfield
  alias pip=pip3

  export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  ```

* install remote-server utilities:

  ```
  sudo apt install -y mosh byobu \
    && echo "_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true" >> .zprofile
  ```

## Additionals

* [byobu](https://www.byobu.org/): tmux config-framework
* [solarized gnome-terminal](https://github.com/Anthony25/gnome-terminal-colors-solarized)

### Non-Console Apps

* Clipboard-Manager: [CopyQ](https://github.com/hluk/CopyQ)
  ```
    sudo add-apt-repository ppa:hluk/copyq
    sudo apt update
    sudo apt install copyq
  ```
* [devdocs-desktop](https://github.com/egoist/devdocs-desktop)
* [Atom Editor](https://atom.io/)
* Password-Management: [Bitwarden](https://bitwarden.com/)
* [flameshot](https://github.com/lupoDharkael/flameshot)
  * screenshot command for keyboard-shortcut `flameshot gui -p $HOME/Bilder/screenshots`
* disk-usage-analyzer [baobab](https://wiki.gnome.org/action/show/Apps/DiskUsageAnalyzer)
* Offline Documentation Browser [zeal](https://zealdocs.org/)


### Plugins for future evaluation

* terminal file manager: [lf](https://github.com/gokcehan/lf)
* grml
* view images in console: catimg
* command-line snippet manager: [Pet](https://github.com/knqyf263/pet)


## Appendix

### neovim configuration

Plugins:
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline): status/tabline for vim
* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes):  collection of themes for vim-airline
* [junegunn/fzf](https://github.com/junegunn/fzf): the command-line fuzzy finder in vim
* [arcticicestudio/nord-vim](https://github.com/arcticicestudio/nord-vim): [nordic](https://www.nordtheme.com/) colorscheme for vim

### zinit managed plugins and config

#### general

* latest command suggested by [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [z autojump](https://github.com/wookayin/fzf-fasd): quickjump into a directory with fzf-support
  * powered by [clvv/fasd](https://github.com/clvv/fasd) and [wookayin/fzf-fasd](https://github.com/wookayin/fzf-fasd)
* [history-search-multi-word](zdharma-continuum/history-search-multi-word)
* [fzf](https://github.com/junegunn/fzf): the command-line fuzzy finder
* [oh-my-zsh/extract](https://github.com/oh-my-zsh/extract): automatically detects the archive-type and extracts it `extract sources.tar.gz`
* [dbrgn/tealdeer](https://github.com/dbrgn/tealdeer): client for [tldr simplified man pages](https://tldr.sh/)
* [stedolan/jq](https://stedolan.github.io/jq/): view, filter or manipulate json files
* [mikefarah/yq](https://mikefarah.gitbook.io/yq/): view, filter or manipulate yaml files
* [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): recursively search a directory for regex (very fast)
* [monochromegane/the_platinum_searcher](https://github.com/monochromegane/the_platinum_searcher): code-search utility

#### git-extras
* [tj/git-extras](https://github.com/tj/git-extras): GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
* [dotzero/git-profile](https://github.com/dotzero/git-profile): add and switch between multiple user profiles in your git repositories
* [wfxr/forgit](https://github.com/wfxr/forgit): A utility tool powered by fzf for using git interactively.
* [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit): git console frontend
* [cli/cli](https://github.com/cli/cli): GitHub’s official command line tool

#### kubernetes

* [kubectl](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/): `kubectl`-command including completions
* [ahmetb/kubectx](https://github.com/ahmetb/kubectx):
  * `kubectx`: switch the cluster
  * `kubens` switch the namespace
* [derailed/k9s](https://github.com/derailed/k9s): extremely fast console frontend for managing any kubernetes cluster
* [google/go-jsonnet](https://github.com/google/go-jsonnet):
  * very fast jsonnet compiler, required by [payfree-io/payfree-deployments](https://github.com/payfree-io/payfree-deployments) to generate the kubernetes resources files
  * see also [jsonnet.org](https://jsonnet.org/)
* [jsonnet-bundler/jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler): package-manager for jsonnet, required by [payfree-io/payfree-deployments](https://github.com/payfree-io/payfree-deployments) to generate the kubernetes resources files
* [istio/istio](https://github.com/istio/istio): `istioctl`-command to install/manage istio within a cluster

#### gcloud

* `_gcloud`: completions for gcloud
* [warrensbox/terraform-switcher](https://github.com/warrensbox/terraform-switcher): switches between terraform-versions

#### silent plugins

* [direnv](https://github.com/direnv/direnv): context information about current directory
* [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k): behind the scenes tool for a beautiful shell 'frontend'
* [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions): many command-completions for the zsh
* [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting): syntax highlighting on the shell itself
* [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh): while not using it primarily, some plugins and code-completions are taken from it
