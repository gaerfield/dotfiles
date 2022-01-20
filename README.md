# dotfiles

This Repository contains my dotfile-configurations managed by [chezmoi](https://www.chezmoi.io) and [zinit](https://github.com/zdharma-continuum/zinit) and some of my main non-console-tools in linux.

* [install and daily operations](https://www.chezmoi.io/user-guide/daily-operations/)

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

### post-install steps

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

## Terminal

### most important fzf-commands
* C-R: search-command history
* C-T: search for file or folder adding to command-line
* A-C: change into directory in subtree
* fif <searchterm>: "find-in-file" does a recursive search including a preview window

### plugins managed by zplug

* Code-Search: [the platinum searcher](https://github.com/monochromegane/the_platinum_searcher)
* Log-File-Viewer: [lnav](http://lnav.org/)
* extract: (oh-my-zsh/extract)
* ripgrep: (BurntSushi/ripgrep)
* json-parser: (stedolan/jq)
* autojump with fasd:
  * main: clvv/fasd
  * oh-my-zsh/fasd
  * wookayin/fzf-fasd
* liangguohuan/fzf-marker
* command-line snippet manager: [Pet](https://github.com/knqyf263/pet)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* some plugins are only available when the profile is enabled (s.a. .zprofile):
  * i.e. the profile kubernetes will enable: `kubectx`, `kubens`, `kubectl` and `k9s`
  * git-extras will enable: git-related extra commands like lazygit

### manual configuration

* [solarized gnome-terminal](https://github.com/Anthony25/gnome-terminal-colors-solarized)
* tmux config-framework: [byobu](http://byobu.co/)

### test in the future

* terminal file manager: [lf](https://github.com/gokcehan/lf)
* grml
* view images in console: catimg
* command-line snippet manager: [Pet](https://github.com/knqyf263/pet)

# Non-Console Apps
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
